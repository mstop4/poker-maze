server_address = "localhost";
port = 3000; 
buffer_size = 64;

buf = buffer_create(buffer_size, buffer_wrap, 1);

local_server = network_create_server(network_socket_tcp, port, 4);
if (local_server < 0) {
	print("Failed to start server");	
	exit;
}
print("Server listening to port " + string(port));

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