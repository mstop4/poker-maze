if (socket >= 0) {
	network_destroy(socket);
	print("Socket destroyed");
}

buffer_delete(buf);