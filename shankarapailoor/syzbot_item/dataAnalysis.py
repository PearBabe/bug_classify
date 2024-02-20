import pandas as pd
import matplotlib.pyplot as plt

# 假设您已成功加载数据到df变量中
df = pd.read_excel("syzbot_data/netbsd.xlsx")
lighter_colors = ['#FFFF99', '#90EE90']
# 找到“Crashes”前10最多的漏洞
top_10_crashes = df.nlargest(10, 'Crashes')

# 计算总的Crashes数量，用于计算占比
total_crashes = df['Crashes'].sum()

# 为前10的漏洞计算占比
top_10_crashes['Percentage'] = (top_10_crashes['Crashes'] / total_crashes) * 100

# 使用matplotlib生成对比图像
fig, ax = plt.subplots(figsize=(10, 8))
top_10_crashes.plot(kind='barh', x='Title', y='Percentage', color=lighter_colors,ax=ax)
ax.set_title('Top 10 NetBSD kernel Vulnerabilities by Crashes Percentage')
ax.set_xlabel('Crashes Percentage')
ax.set_ylabel('Vulnerability Title')

plt.tight_layout()
plt.grid()
plt.show()

# 打印出前10的漏洞及其Crashes和占比
print(top_10_crashes[['Title', 'Crashes', 'Percentage']])
