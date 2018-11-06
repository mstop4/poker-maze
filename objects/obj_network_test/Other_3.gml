if (socket >= 0) {
	network_destroy(socket);
	console_log(who.client, "Socket destroyed");
}

buffer_delete(buf);