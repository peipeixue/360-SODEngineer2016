#!/usr/bin/python

import socket,sys,string
host="localhost"
port=8001

def main():
	sock=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	sock.connect((host,port))
	message = raw_input("please input a cmd :")
	sock.send(message.strip())
	print sock.recv(1024)
	sock.close()

if __name__=="__main__":
	main()
