#!/usr/bin/ruby

require "socket"
require "pry"

# ポート番号20000番でopen
# s0 = TCPServer.open(10000)
s0 = TCPServer.open(20000)

# クライアントからの接続を受け付ける
p "dada"
sock = s0.accept

p "sock"
p sock
# クライアントからのデータを最後まで受信する
# 受信したデータはコンソールに表示される
# while buf = sock.gets 
p sock.gets
p"test"
while buf = sock.gets
  p buf
  p "dada"
end

# クライアントとの接続ソケットを閉じる
sock.close

# 待ちうけソケットを閉じる
s0.close
