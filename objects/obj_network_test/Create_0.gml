init_enums();

socket = -1;
connection = -1;
client_console = "CLIENT\n";
server_console = "SERVER\n";

buf = buffer_create(buffer_size, buffer_wrap, 1);

local_server = network_create_server(network_socket_tcp, port, 4);
if (local_server < 0) {
	console_log(who.server, "Failed to start server");	
	exit;
}
console_log(who.server, "Server listening to port " + string(port));