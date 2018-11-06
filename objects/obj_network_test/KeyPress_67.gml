socket = network_create_socket(network_socket_tcp);
if (socket < 0) {
	print("Failed to create socket");	
	exit;
}

print("Socket created");

connected = network_connect(socket, server_address, port);
if (connected < 0) {
	print("Failed to connect to server");	
	exit;
}
print("Connected to server on " + string(server_address) + ":" + string(port));