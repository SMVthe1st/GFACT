import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

scan = input("Enter an address to scan: ")

for x in range(0, 1025):
  if sock.connect_ex((scan, x)) == 0:
    print("Port number %s:  Connection open!" % x)
         
sock.close()
