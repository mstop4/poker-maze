init_enums();

local_server = network_create_server(network_socket_tcp, port, 4);

if (local_server < 0) {
	print("Failed to start server");	
	exit;
}

print("Server listening to port ", string(port));