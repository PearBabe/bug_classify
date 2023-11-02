import pandas as pd
import re
from sklearn.preprocessing import MultiLabelBinarizer
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.pipeline import Pipeline
from sklearn.multiclass import OneVsRestClassifier
from gensim.models import Word2Vec
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
import joblib
from joblib import dump  # 保存标签模型
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

# 加载数据
df = pd.read_excel('cleaned_result.xlsx')


def f2(x):
    result = re.sub('\W', ' ', x)
    result = re.sub('[0-9]', ' ', result)
    result = word_tokenize(result)
    return result


df['Sample'] = df['Sample'].str.lower().str.replace('[^\w\s]', '')
stop_words = set(stopwords.words('english'))
lemmatizer = WordNetLemmatizer()
df['Sample'] = df['Sample'].apply(lambda x: ' '.join([
    lemmatizer.lemmatize(word) for word in word_tokenize(x)
    if word not in stop_words
]))

mlb = MultiLabelBinarizer()
df['Tag'] = df['Tag'].str.split()
tags = mlb.fit_transform(df['Tag'])

dump(mlb, 'mlb.joblib')

w2v_model = Word2Vec(df['Sample'].apply(word_tokenize), min_count=1)

# 使用word2vec模型获取向量特征，取文本中所有单词的向量的平均值
# 划分数据集
X_train, X_test, y_train, y_test = train_test_split(df['Sample'],
                                                    tags,
                                                    test_size=0.2,
                                                    random_state=42)

# 训练分类器
classifier = Pipeline([
    ('vectorizer', CountVectorizer()),  # 将文本转换为向量
    ('clf', OneVsRestClassifier(MultinomialNB()))  # 使用朴素贝叶斯分类器进行训练
])
classifier.fit(X_train, y_train)

# # 保存模型
# with open('model.pkl', 'wb') as file:
#     pickle.dump(classifier, file)
# 保存模型
joblib.dump(classifier, 'classifier_model.joblib')

# 预测测试集结果
y_pred = classifier.predict(X_test)

# 计算各项评估指标
accuracy = accuracy_score(y_test, y_pred)
precision = precision_score(y_test, y_pred, average='micro')
recall = recall_score(y_test, y_pred, average='micro')
f1 = f1_score(y_test, y_pred, average='micro')

print('准确率: {}'.format(accuracy))
print('精确率: {}'.format(precision))
print('召回率: {}'.format(recall))
print('F1分数: {}'.format(f1))
