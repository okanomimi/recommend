#!/usr/bin/ruby

require "socket"
require "pry"
require "WordToHash"

# ポート番号20000番でopen
# s0 = TCPServer.open(10000)
s0 = TCPServer.open(20000)

# クライアントからの接続を受け付ける
sock = s0.accept


# クライアントからのデータを最後まで受信する
# 受信したデータはコンソールに表示される
p sock.gets
binding.pry ;
word_list = Array.new
word_lit.each
#変換
hash_maker = WordToHash.new(word_list)
word_vec = hash_maker.run   #特徴ベクトル化したデータの取得
#データベースのデータと照合
#結果を文字列にして返す [name , "dds"]

sock.write("dsdad") ;   #つながっているソケットに文字列を送る
# クライアントとの接続ソケットを閉じる
sock.close

# 待ちうけソケットを閉じる
s0.close
