#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require "pry"
require "yaml"
require "/home/okano/okano/RRSP/v0.3/rubyOkn/BasicTool"

include BasicTool

#
# == 類似度を測る
#
class ExamineSimilarity
  attr_accessor :input_word_list ;

  #
  #
  #
  def initialize(word_list=nil)
    if word_list != nil
      @input_word_set = word_list 
    end
  end
 
  #
  #
  #
  def set_word_set(word_list)
    @input_word_set = word_list 
  end

  #
  # === コサイン類似度
  #
  def cos(v1, v2)
    sum = 0.0 
    same_key = Array.new 
    v1.keys.each do |key|
      if v2[key] != nil
        sum += v1[key] * v2[key] 
      else
        v2[key] = 0.0
        sum += v1[key] * v2[key] 
      end
      same_key.push(key)
    end

    # v1_test = de(v1, same_key)  
    v1_test = de(v1,v1.keys)
    # v2_test = de(v2, same_key)
    v2_test = de(v2,v2.keys)

    return sum/(v1_test * v2_test)
  end

  def de(v, key_array)
    sum = 0.0
    key_array.each do |key|
      sum += v[key] ** 2
    end 
    return Math.sqrt(sum)
  end

  #
  # === 類似度を調べて、高い要素名と、類似度を返す
  #
  def calc_sim
    result = Hash.new     #単語と類似度

    word_list = YAML.load_file("word_list.yml") ;
    # word_list = YAML.load_file("word_list.yml") ;
    # word_list2 = YAML.load_file("word_list.yml") ;
    # word_list2 = YAML.load_file("word_set/word_list_test.yml") ;

    word_vec = []
    word_list.each do |word|
      word_vec.push(YAML.load_file("data_set/"+word+".yml")) ;
    end

    #類似度を調べて、結果を保存していく
    word_vec.each_with_index do |word, i|
        result[word_list[i]] = cos(word, @input_word_set)
    end
    
    result = hash_v_sort(result)   #昇順にソートする
    result = cut_hash(result, 10)   #上位10個だけ返す
    return result
  end
end
