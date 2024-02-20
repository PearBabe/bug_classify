import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Load the data
file_path_subsystems = 'syzbot_data/subsystems_linux.xlsx'
data_subsystems = pd.read_excel(file_path_subsystems)
lighter_colors = ['#FFFF99', '#90EE90']
# Identify the top 10 vulnerability classifications by fix count
top_10_fixed = data_subsystems.nlargest(10, 'Fixed')

# Calculate the percentage of each classification's fixes out of the total fixes for the top 10
total_fixes = data_subsystems['Fixed'].sum()
top_10_fixed['Percentage'] = top_10_fixed['Fixed'] / total_fixes * 100

# Visualization with percentages on the x-axis
plt.figure(figsize=(12, 8))
colors = plt.cm.YlGnBu(np.linspace(0.3, 0.9, len(top_10_fixed['Fixed'])))
plt.barh(top_10_fixed['Name'], top_10_fixed['Percentage'], color=lighter_colors)
plt.xlabel('Percentage of Total Fixes (%)')
plt.ylabel('Vulnerability Classification')
plt.title('Top 10 Vulnerability Classifications by Fix Count (Percentage of Total Fixes)')
plt.gca().invert_yaxis()  # Invert the y-axis to have the highest values on top
plt.grid(axis='x', linestyle='--', alpha=0.6)

# Save the plot
plot_path = 'top_10_vulnerability_fixes_percentage.png'
plt.savefig(plot_path)

# Show the plot
plt.show()

# Note: Replace '/path/to/subsystems_linux.xlsx' and '/path/to/save/top_10_vulnerability_fixes_percentage.png'
# with the actual paths to your Excel file and where you'd like to save the chart.
