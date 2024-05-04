import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.bind(("0.0.0.0", 1256))
sock.listen(10)

con = False

while True:
    if con is False:
        print("Waiting...")
        con, client = sock.accept()
        print("Connecting to: ", client)
    else:
        recv = con.recv(1024).decode("utf-8")
        print("[RECIEVED]: " + recv)
        con.send(str.encode("Echoing: " + recv))

sock.close()
