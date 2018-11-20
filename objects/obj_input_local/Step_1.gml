// keyboard/mouse

if (control_slot == -1) {
	for (var i=0; i<action.max_actions; i++) {
		switch (kbm_device[i]) {
			
			case device.keyboard:
				button_pressed[i] = keyboard_check_pressed(kbm_key[i]);
				button_held[i] = keyboard_check(kbm_key[i]);
				button_released[i] = keyboard_check_released(kbm_key[i]);
				break;
				
			case device.mouse:
				button_pressed[i] = device_mouse_check_button_pressed(mouse_device_id,kbm_key[i]);
				button_held[i] = device_mouse_check_button(mouse_device_id,kbm_key[i]);
				button_released[i] = device_mouse_check_button_released(mouse_device_id,kbm_key[i]);
				break;
				
			default:
				button_pressed[i] = false;
				button_held[i] = false;
				button_released[i] = false;				
		}
	}
}

// gamepad

else {
	// stick
	var _h_input = gamepad_axis_value(control_slot,gp_axislh);
	var _v_input = gamepad_axis_value(control_slot,gp_axislv);
	var _old_button_state;
	
	//up
	button_pressed[action.up] = false;
	button_released[action.up] = false;
	
	_old_button_state = button_held[action.up];
	button_held[action.up] = _v_input <= -stick_threshold;
	
	if (!_old_button_state && button_held[action.up])
		button_pressed[action.up] = true;
	else if (_old_button_state && !button_held[action.up])
		button_released[action.up] = true;
		
	//down
	button_pressed[action.down] = false;
	button_released[action.down] = false;
	
	_old_button_state = button_held[action.down];
	button_held[action.down] = _v_input >= stick_threshold;
	
	if (!_old_button_state && button_held[action.down])
		button_pressed[action.down] = true;
	else if (_old_button_state && !button_held[action.down])
		button_released[action.down] = true;
		
	//left
	button_pressed[action.left] = false;
	button_released[action.left] = false;
	
	_old_button_state = button_held[action.left];
	button_held[action.left] = _h_input <= -stick_threshold;
	
	if (!_old_button_state && button_held[action.left])
		button_pressed[action.left] = true;
	else if (_old_button_state && !button_held[action.left])
		button_released[action.left] = true;
		
	//right
	button_pressed[action.right] = false;
	button_released[action.right] = false;
	
	_old_button_state = button_held[action.right];
	button_held[action.right] = _h_input >= stick_threshold;
	
	if (!_old_button_state && button_held[action.right])
		button_pressed[action.right] = true;
	else if (_old_button_state && !button_held[action.right])
		button_released[action.right] = true;
		
	
	// d-pad
	button_pressed[action.up] |= gamepad_button_check_pressed(control_slot,gp_padu);
	button_held[action.up] |= gamepad_button_check(control_slot,gp_padu);
	button_released[action.up] |= gamepad_button_check_released(control_slot,gp_padu);
	
	button_pressed[action.down] |= gamepad_button_check_pressed(control_slot,gp_padd);
	button_held[action.down] |= gamepad_button_check(control_slot,gp_padd);
	button_released[action.down] |= gamepad_button_check_released(control_slot,gp_padd);
	
	button_pressed[action.left] |= gamepad_button_check_pressed(control_slot,gp_padl);
	button_held[action.left] |= gamepad_button_check(control_slot,gp_padl);
	button_released[action.left] |= gamepad_button_check_released(control_slot,gp_padl);
	
	button_pressed[action.right] |= gamepad_button_check_pressed(control_slot,gp_padr);
	button_held[action.right] |= gamepad_button_check(control_slot,gp_padr);
	button_released[action.right] |= gamepad_button_check_released(control_slot,gp_padr);
	
	// buttons
	/*for (var i=action.shoot; i<action.max_actions; i++) {
		button_pressed[i] = gamepad_button_check_pressed(control_slot,gp_key[i]);
		button_held[i] = gamepad_button_check(control_slot,gp_key[i]);
		button_released[i] = gamepad_button_check_released(control_slot,gp_key[i]);
	}*/
}

if (obj_client.socket >= 0 && obj_client.connection >= 0) {
	send_input(obj_client.player_number, input_buffer, 5, obj_client.socket);
}