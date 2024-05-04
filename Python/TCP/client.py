import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(("0.0.0.0", 1256))

print("Connected!")

while True:
    sock.send(str.encode(input("[SEND]: ")))
    print(sock.recv(1024).decode("utf-8"))

sock.close()
