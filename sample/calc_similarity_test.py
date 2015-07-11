# coding: UTF-8

import math
import yaml
import os
import sys
import pdb

def jaccard(v1, v2):
    numerator = sum([c in v2 for c in v1])
    denominator = len(v1) + len(v2) - numerator
    return float(numerator) / denominator if denominator != 0 else 0

def dice(v1, v2):
    numerator = sum([c in v2 for c in v1])
    denominator = len(v1) + len(v2)
    return 2 * float(numerator) / denominator if denominator != 0 else 0

def simpson(v1, v2):
    numerator = sum([c in v2 for c in v1])
    denominator = min(len(v1), len(v2))
    return float(numerator) / denominator if denominator != 0 else 0

def cos(v1, v2):
    numerator = sum([v1[c] * v2[c] for c in v1 if c in v2])
    # pdb.set_trace() 
    # pdb.run() 
    square = lambda x: x * x
    denominator =  math.sqrt(sum(map(square, v1.values())) * sum(map(square, v2.values())))
    return float(numerator) / denominator if denominator != 0 else 0

def jaccard_weight(v1, v2):
    numerator = 0
    denominator = 0

    keys = set(v1.keys())
    keys.update(v2.keys())

    for k in keys:
        f1 = v1.get(k, 0)
        f2 = v2.get(k, 0)
        numerator += min(f1, f2)
        denominator += max(f1, f2)
    return float(numerator) / denominator if denominator != 0 else 0

def dice_weight(v1, v2):
    numerator = 0
    denominator = 0

    keys = set(v1.keys())
    keys.update(v2.keys())

    for k in keys:
        f1 = v1.get(k, 0)
        f2 = v2.get(k, 0)
        numerator += min(f1, f2)
        denominator += f1 + f2
    return 2 * float(numerator) / denominator if denominator != 0 else 0


if __name__ == '__main__':
  # v1 = {'帰宅': 1,  '風呂': 1,  '生': 1,  '協': 1,  '晩': 1,  '家': 1,  '食べる': 2,  '飽きる': 1,  'する': 1}
  # v1 = {"テニス": 1,  "風呂": 1,}
  # v2 = {'テニス': 1,  '風呂': 1, 'おかず': 1}
  # v3 = {'部屋': 1,  '人': 1,  '寝る': 2,  'いる': 1,  '明らか': 1,  '携帯': 1,  'いじる': 1,  '原因': 1,  '一つ': 1}

  #元の単語リストの呼び出し
  f = open("word_list.yml", "r")
  word_list = yaml.load(f)
  f.close()

  #各単語のymlファイルの読み込み
  word_vec_list = []
  for word in word_list:
      word = word.encode('utf-8')
      f = open("data_set/"+word+".yml") 
      word_data = yaml.load(f)
      f.close() 
      word_vec_list.append(word_data)

  for i,word_vec in enumerate(word_vec_list):
      for i2,word_vec2 in enumerate(word_vec_list):
        print word_list[i]+":"+word_list[i2], 
        print cos(word_vec, word_vec2)

  # while True:
  #     print "1:v1に追加, 2:v2に追加, 3:コサイン類似度を表示:, else:終了 : ", 
  #   input_line = sys.stdin.readline()
  #   print type(input_line)
  #   if int(input_line) == 3:
  #       print "cos_sim:", 
  #       print cos(v1, v2)
  #       print "v1", 
  #       print v1
  #       print "v2", 
  #       print v2
  #   elif int(input_line) == 2:
  #       print "v2:", 
  #       input_line = sys.stdin.readline()
  #       v2[input_line] = 0.3
  #   elif int(input_line) == 1:
  #       print "v1:", 
  #       input_line = sys.stdin.readline()
  #       v1[input_line] = 1
  #   else :
  #       exit() 
  #
  #

  # print cos(v1, v2)
  # print cos(v1, v3)
