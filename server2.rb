#!/usr/bin/ruby
# -*- coding: utf-8 -*-

$LOAD_PATH.push(File::dirname($0)) ;
require "socket"
require "pry"
require "WordToHash"
require "ExamineSimilarity"

# ポート番号20000番でopen
# s0 = TCPServer.open(10000)
s0 = TCPServer.open(20000)

# クライアントからの接続を受け付ける
sock = s0.accept


# クライアントからのデータを最後まで受信する
# 受信したデータはコンソールに表示される
words = sock.gets
word_list = words.split(",")  #受け取った文字列を配列化。

#文字列がANSなんとかでくるのでutfに変換
encoded_word_list = Array.new 
word_list.each do |word|
  new_word = word.force_encoding("utf-8")
  encoded_word_list.push(new_word.chomp)
end

#変換
hash_maker = WordToHash.new(encoded_word_list)
word_vec = hash_maker.run   #特徴ベクトル化したデータの取得

#############################################################
#
#データベースのデータと照合
#とりあえず、yamlファイルを活用
#
#############################################################

calc_similarity = ExamineSimilarity.new(word_vec)
result = calc_similarity.calc_sim   #

############################################################
#
#結果を文字列にして返す [name , "dds"]
#
############################################################
# binding.pry ;
frist= true ;
result.each_with_index do |r, i|
  r.each do |rr|
    if !frist 
      sock.write("#") ;   #つながっているソケットに文字列を送る
    else 
      frist = false
    end
    # binding.pry ;
    # sock.write(rr.to_s.force_encoding("utf-8")) ;   #つながっているソケットに文字列を送る
    sock.write(rr) ;   #つながっているソケットに文字列を送る
  end
  # クライアントとの接続ソケットを閉じる
end
sock.write("#")
sock.close

# 待ちうけソケットを閉じる
s0.close
