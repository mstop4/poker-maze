/// @arg server_address
/// @arg port

var _server_address = argument[0];
var _port = argument[1];

if (socket < 0) {
	socket = network_create_socket(network_socket_tcp);
	if (socket < 0) {
		print("Failed to create socket");	
		exit;
	}
	print("Socket created");
}

else {
	print("Socket already exists");
}

if (connection < 0) {
	connection = network_connect(socket, _server_address, _port);
	if (connection < 0) {
		print("Failed to connect to server");	
		exit;
	}
	print("Connected to server on " + string(_server_address) + ":" + string(_port));
}

else {
	print("Already connected to server");
}