/// @arg player_num
/// @arg input_buffer
/// @arg buffer_size
/// @arg socket

var _player_num = argument[0];
var _input_buffer = argument[1];
var _buffer_size = argument[2];
var _socket = argument[3];

var _has_input = false;

buffer_seek(_input_buffer,buffer_seek_start, 0);
buffer_write(_input_buffer,buffer_u8,message_type.input);
buffer_write(_input_buffer,buffer_u8,_player_num);

for (var i=0; i<action.max_actions; i++) {
	var _result;
	_result = button_pressed[i] + (button_released[i] << 1);
	if (_result != 0) _has_input = true;
	
	buffer_write(_input_buffer,buffer_u8,_result);
}

if (_has_input) {
	_buffer_size = buffer_get_size(_input_buffer);
	network_send_packet(_socket, _input_buffer, _buffer_size);
}