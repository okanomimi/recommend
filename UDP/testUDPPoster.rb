
#!/usr/bin/ruby

require "socket"

udp = UDPSocket.open()

sockaddr = Socket.pack_sockaddr_in(10000, "127.0.0.1")
# udp.send("HELLO", 0, sockaddr)
i = ["test", "test"]
udp.send(i.to_s, 0, sockaddr)
udp.close
