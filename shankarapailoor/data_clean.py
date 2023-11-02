import pandas as pd
import re
# from sklearn.model_selection import train_test_split


def clean_data(text):
    # 如果文本不是字符串，直接返回
    if not isinstance(text, str):
        return text

    lines = [line.strip() for line in text.split('\n') if line.strip()]
    clean_lines = []

    # CPU寄存器
    registers = [
        'RIP', 'RAX', 'RBX', 'RCX', 'RDX', 'RSI', 'RDI', 'RBP', 'RSP', 'R08',
        'R09', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15', 'CS', 'DS', 'ES',
        'FS', 'GS', 'SS', 'EFLAGS', 'CR0', 'CR2', 'CR3', 'CR4', 'DR0', 'DR1',
        'DR2', 'DR3', 'DR6', 'DR7'
    ]

    for line in lines:
        # 规则1: 删除'='连续出现的行
        if '===' in line:
            continue

        # 如果字符串开头有一个空格，则先暂且跳过空格，处理完后再加上
        if line.startswith(' '):
            has_leading_space = True
            line = line[1:]
        else:
            has_leading_space = False

        # 规则2: 删除url部分
        # 按空格分割字符串
        sub_strings = line.split(' ')

        # 找到第一个包含'/'的子串，并拼接到一起
        line_1 = ''
        line_2 = ''
        for sub_str in sub_strings:
            if '/' in sub_str:
                line_2 = sub_str
                break
            line_1 += sub_str + ' '
        line_1 = line_1.strip()  # 去掉末尾空格

        # 如果包含‘+’，则只保留‘+’之前内容；否则置为空
        if '+' in line_2:
            line_2 = line_2.split('+')[0].strip()
        else:
            line_2 = ''

        # 合并line_1和line_2
        if line_1:
            line = line_1 + ' ' + line_2
        else:
            line = line_2

        # 规则3: 删除'Code: '开头的行
        if line.startswith('Code: '):
            continue

        # 规则4: 删除包含CPU寄存器的行
        if any([line.startswith(reg) for reg in registers]):
            continue

        # 规则5: 删除无用文本行
        if any(keyword in line for keyword in [
                'Call Trace', 'Call trace', '<IRQ>', '</IRQ>', '<TASK>',
                '</TASK>', '--', '[ end trace 0000000000000000 ]', 'page:',
                'pfn:', 'flags:', 'raw: '
        ]):
            continue

        # 规则6: 如果包含‘Memory state around the buggy address’或‘Code disassembly (best guess)’，删除此行及后续所有行
        if 'Memory state around the buggy address' in line or 'Code disassembly (best guess)' in line:
            break

        # 规则7 删除多余的空格
        line = re.sub(' +', ' ', line)

        # 规则8 删除16位的十六进制表示
        line = re.sub(r'\b[0-9A-Fa-f]{16}\b', '', line)

        # 如果之前记录了字符串开头有一个空格，现在要加回去
        if has_leading_space:
            line += ' ' + line

        clean_lines.append(line)

    clean_lines = '\n'.join(clean_lines)

    # 将多个连续的换行符替换为一个换行符
    clean_lines = clean_lines.replace('\n\n', '\n')

    # 如果"Modules linked in:"后边没有值，则删除
    if clean_lines.endswith("Modules linked in: "):
        clean_lines = clean_lines[:-len("Modules linked in: ")]

    return clean_lines


# 读取Excel文件
df = pd.read_excel("result2.xlsx")

# 对'Sample'列进行清洗
df['Sample'] = df['Sample'].apply(clean_data)

print(f"数据清洗后数据集数量:{len(df)}")

# 删除Tag和Sample列为空的行
df.dropna(subset=['Sample', 'Tag'], inplace=True)

# 删除这两列的空白值
df = df[~(df['Sample'] == '') & ~(df['Sample'] == '\n\n')
        & ~(df['Sample'] == '\n') & ~(df['Tag'] == '') & ~(df['Tag'] == '  ')]

print(f"删除空值后数据集数量:{len(df)}")

# 保存清洗后的数据到新的Excel文件
df.to_excel('cleaned_result.xlsx', index=False)
