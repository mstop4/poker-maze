if (connected >= 0) {
	buffer_seek(buf, buffer_seek_start, 0);
	buffer_write(buf, buffer_string, "hello");
	network_send_packet(socket, buf, buffer_size);
}