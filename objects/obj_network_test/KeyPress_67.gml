if (socket < 0) {
	socket = network_create_socket(network_socket_tcp);
	if (socket < 0) {
		console_log(who.client, "Failed to create socket");	
		exit;
	}
	console_log(who.client, "Socket created");
}

else {
	console_log(who.client, "Socket already exists");
}

if (connection < 0) {
	connection = network_connect(socket, server_address, port);
	if (connection < 0) {
		console_log(who.client, "Failed to connect to server");	
		exit;
	}
	console_log(who.client, "Connected to server on " + string(server_address) + ":" + string(port));
}

else {
	console_log(who.client, "Already connected to server");
}