import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

scan = input("Enter an address to scan: ")

match sock.connect_ex(("127.0.0.1", int(scan))):
  case 0:
    print("Port number %s:  Connection open!" % scan)
  case 111:
    print("Port number %s:  Connection refused" % scan)
  case 106:
    print("Port number %s:  Already in use" % scan)
  case _:
    print("Errno: %s" % str(sock.connect_ex(("127.0.0.1", scan))))
         
sock.close()
