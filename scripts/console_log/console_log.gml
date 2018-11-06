if (argument[0] == who.client) {
	for (var i=1; i<argument_count; i++) {	
		client_console += string(argument[i]);
	}
	client_console += "\n";
}

else if (argument[0] == who.server) {
	for (var i=1; i<argument_count; i++) {	
		server_console += string(argument[i]);
	}
	server_console += "\n";
}