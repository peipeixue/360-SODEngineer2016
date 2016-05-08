#coding=utf-8
import socket
import threading,sys,string
import os
port=8001
list=50
dic={}

def handle(client,address):
	try:
		client.settimeout(500)
		buf=client.recv(1024)
		os.system(buf)
	except socket.timeout:
		print 'time out'
	client.close()


def main():
	sock=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
	sock.bind(('localhost',port))
	sock.listen(list)
	
	while True:
		client,address = sock.accept()
		handleRequest = threading.Thread(target=handle,args=(client,address))
		handleRequest.start()





if __name__=="__main__":
	main()
