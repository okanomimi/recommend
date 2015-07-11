# -*- coding: UTF-8 -*-
from sklearn import metrics
from sklearn.metrics import pairwise_distances
from sklearn import datasets
import numpy as np
from sklearn.cluster import KMeans


dataset = datasets.load_iris()
X = dataset.data
y = dataset.target

# 内容をちょっと覗き見してみる
print (X)
print (y)

kmeans_model = KMeans(n_clusters=3, random_state=1).fit(X)
labels = kmeans_model.labels_

# ユークリッド距離を算出してみる
print ( metrics.silhouette_score(X, labels, metric='euclidean') )

# 昨日のコードを利用してクラスタリングをおこなう
clusters = make_cluster(X)

# 結果をファイルに出力する
write_cluster(clusters, 'out.txt')

# 生成したクラスタリングの内容を覗き見する
print ( clusters )
