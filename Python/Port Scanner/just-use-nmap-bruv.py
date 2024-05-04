import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

for x in range(1, 1025):
  if sock.connect_ex(("127.0.0.1", x)) == 0:
    print("Port number %s:  Connection open!" % (str(x)))
         
sock.close()
