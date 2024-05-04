import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

scan = input("Enter an address to scan: ")

for x in range(0, 1025):
  match sock.connect_ex((scan, x)):
    case 0:
      print("Port number %s:  Connection open!" % x)
    case 111:
      print("Port number %s:  Connection refused" % x)
    case 106:
      print("Port number %s:  Already in use" % x)
    case _:
      print("Errno: %s" % str(sock.connect_ex((scan, x))))
         
sock.close()
