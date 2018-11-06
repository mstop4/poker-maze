var ip = async_load[? "ip"];
var port = async_load[? "port"];

switch (async_load[? "type"]) {
	
	case network_type_connect:
		var socket_id = async_load[? "socket"];
		console_log(who.server, "Client ", socket_id, " connected from: ", ip, ":", port);
		break;
		
	case network_type_disconnect:
		var socket_id = async_load[? "socket"];
		console_log(who.server, "Client ", socket_id, " disconnected");
		break;
		
	case network_type_data:
		var data = async_load[? "buffer"];
		var data_len = async_load[? "size"];
		
		var msg = buffer_read(data, buffer_string);
		console_log(who.server,  ip, ":", port, " sez: ", msg);
		break;
}