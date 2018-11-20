/// @arg input_buffer

var _input_buffer = argument[0];

var _player = buffer_read(_input_buffer,buffer_u8);
print("Player: ", _player);

for (var i=0; i<action.max_actions; i++) {
	var _input = buffer_read(_input_buffer,buffer_u8);
	print(_input);
}