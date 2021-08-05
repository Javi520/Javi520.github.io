import binascii
import http.server as server
import socket
import struct
import sys
from dataclasses import dataclass

# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the port
server_address = ('localhost', 15000)
print('starting up on {} port {}'.format(*server_address))
sock.bind(server_address)

@dataclass
class http_headers:

@dataclass
class http_request:
    tipo:str
    ruta:str
    

# Listen for incoming connections
sock.listen(1)

while True:
    connection, client_address = sock.accept()
    try:
        print('connection from', client_address)

        # Receive the data in small chunks and retransmit it
        while True:
            data = connection.recv(200)
            print(data)
            if str(data[0:3]).find("GET")!=-1:
                print("GET")
            if str(data[0:4]).find("POST")!=-1:
                print("POST")
            if data:
                print('sending data back to the client')
                
            else:
                print('no data from', client_address)
                break

    finally:
        # Clean up the connection
        connection.close()
