if (connection >= 0) {
	var msg = "Hello";
	buffer_seek(buf, buffer_seek_start, 0);
	buffer_write(buf, buffer_string, msg);
	network_send_packet(socket, buf, buffer_size);
	console_log(who.client, "Say ", msg, " to server");
}