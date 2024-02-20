
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load the data
netbsd_data = pd.read_excel("syzbot_data/gvisor.xlsx")

# Find the top 10 vulnerabilities by "Crashes"
top_10_netbsd_vulnerabilities = netbsd_data.nlargest(10, "Crashes")

# Calculate the proportion of each vulnerability's crashes to the total crashes
total_netbsd_crashes = netbsd_data["Crashes"].sum()
top_10_netbsd_vulnerabilities["Proportion"] = top_10_netbsd_vulnerabilities["Crashes"] / total_netbsd_crashes * 100

# Select relevant columns for analysis
netbsd_analysis_result = top_10_netbsd_vulnerabilities[["Title", "Crashes", "Proportion"]]

# Save the result to a new CSV file
# netbsd_analysis_result.to_csv("/mnt/data/top_10_netbsd_vulnerabilities.csv", index=False)

# Create a horizontal bar plot with seaborn using specified light yellow and green colors
# Generate the bar plot again with adjustments for better display of the result
plt.figure(figsize=(14, 10))
netbsd_bar_plot = sns.barplot(
    x=netbsd_analysis_result["Proportion"],
    y=netbsd_analysis_result["Title"],
    palette=sns.color_palette(["#FFFF99", "#90EE90"]),
    orient='h'
)

# Add the percentages on the bars
for p in netbsd_bar_plot.patches:
    width = p.get_width()
    plt.text(5 + width, p.get_y() + 0.55 * p.get_height(),
             f'{width:.1f}%',
             ha='center', va='center')

# Set the labels and title to match the given style
plt.xlabel('Crashes Percentage')
plt.ylabel('Vulnerability Title')
plt.title('Top 10 gVisor Kernel Vulnerabilities by Crashes Percentage')

# Adjust plot limits and layout for better visibility
plt.xlim(0, netbsd_analysis_result["Proportion"].max() * 1.1)  # Add some space for text
plt.tight_layout()

# Removing the right and top borders
sns.despine()

# Save the figure with a filename that reflects the adjustment
adjusted_netbsd_plot_path = "adjusted_netbsd_vulnerabilities_plot.png"
plt.savefig(adjusted_netbsd_plot_path)

# Show the plot
plt.show()

# Return the path to the adjusted plot image
adjusted_netbsd_plot_path

