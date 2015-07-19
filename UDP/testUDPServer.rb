#!/usr/bin/ruby

require "socket"

udps = UDPSocket.open()

udps.bind("0.0.0.0", 10000) #(host, port)

loop do
p udps.recv(65535)
# p udps.recv(2)
p udps.recv
end
udps.close
