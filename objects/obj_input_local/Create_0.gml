control_slot = -1;
mouse_device_id = 0;

kbm_key[action.up] = ord("W");
kbm_key[action.down] = ord("S");
kbm_key[action.left] = ord("A");
kbm_key[action.right] = ord("D");

kbm_device[action.up] = device.keyboard;
kbm_device[action.down] = device.keyboard;
kbm_device[action.left] = device.keyboard;
kbm_device[action.right] = device.keyboard;

for (var i=0; i<action.max_actions; i++) {
	button_pressed[i] = false;
	button_held[i] = false;
	button_released[i] = false;
}

input_buffer = buffer_create(8,buffer_grow,1);
