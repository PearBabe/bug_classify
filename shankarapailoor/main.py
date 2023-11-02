import re
import joblib
import sys
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer


# 数据预处理
def preprocess(text):
    text = text.lower().replace('[^\w\s]', '')
    stop_words = set(stopwords.words('english'))
    text = re.sub('\W', ' ', text)
    # text = re.sub('[0-9]', ' ', text)
    lemmatizer = WordNetLemmatizer()
    text = ' '.join([
        lemmatizer.lemmatize(word) for word in word_tokenize(text)
        if word not in stop_words
    ])
    return text


# 加载模型
mlb = joblib.load('mlb.joblib')
classifier = joblib.load('classifier_model.joblib')
str1 = sys.argv[1]


def classify(text_input):
    bug_description = text_input
    bug_description = preprocess(bug_description)
    prediction = classifier.predict([bug_description])
    predicted_tags = mlb.inverse_transform(prediction)

    prediction_binary = str(prediction[0])
    prediction_tags = predicted_tags[0]
    return prediction_binary, prediction_tags


def bug_report(text_input):
    prediction_binary, prediction_tags = classify(text_input)
    # for index in prediction_binary:
    #     print(index, end='')               
    for index in prediction_tags:
        print(index, end='')
        print(' ', end='')


bug_report(str1)

