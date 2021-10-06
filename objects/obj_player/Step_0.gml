// Apply friction
var _cur_dir = point_direction(0, 0, my_speed.x, my_speed.y);
var _fric_x = lengthdir_x(move_friction, _cur_dir);
var _fric_y = lengthdir_y(move_friction, _cur_dir);

my_speed.x = abs(my_speed.x) < abs(_fric_x) 
	? 0
	: my_speed.x - _fric_x;
	
my_speed.y = abs(my_speed.y) < abs(_fric_y) 
	? 0
	: my_speed.y - _fric_y;

// Apply accel
if (my_state == PLAYER_STATE.OK) {
	var _h_input = keyboard_check(vk_right) - keyboard_check(vk_left); 
	var _v_input = keyboard_check(vk_down) - keyboard_check(vk_up);

	if (_h_input != 0 || _v_input != 0) {
		var _input_dir = point_direction(0, 0, _h_input, _v_input);
		var _new_speed_x = my_speed.x + lengthdir_x(move_accel, _input_dir);
		var _new_speed_y = my_speed.y + lengthdir_y(move_accel, _input_dir);
	
		var _cur_speed = point_distance(0, 0, my_speed.x, my_speed.y);
		var _new_speed = point_distance(0, 0, _new_speed_x, _new_speed_y);
	
		if (_cur_speed <= max_speed || _new_speed <= max_speed) {
			my_speed.x += lengthdir_x(move_accel, _input_dir);
			my_speed.y += lengthdir_y(move_accel, _input_dir);
	
			_cur_speed = point_distance(0, 0, my_speed.x, my_speed.y);
	
			if (_cur_speed > max_speed) {
				var _reduction_ratio = max_speed / _cur_speed;
		
				my_speed.x *= _reduction_ratio;
				my_speed.y *= _reduction_ratio;
			}
		}
	}
}

// Collision check
moved = false;
var _prev_x = x;
var _prev_y = y;

// Left right
// Round x speed away from 0
var _int_speed_x = my_speed.x > 0 ? ceil(my_speed.x) : floor(my_speed.x);

var _left = tilemap_get_cell_x_at_pixel(wall_tilemap, bbox_left + _int_speed_x, bbox_top);
var _top = tilemap_get_cell_y_at_pixel(wall_tilemap, bbox_left, bbox_top);
var _right = tilemap_get_cell_x_at_pixel(wall_tilemap, bbox_right + _int_speed_x, bbox_bottom);
var _bottom = tilemap_get_cell_y_at_pixel(wall_tilemap, bbox_right, bbox_bottom);

if (my_speed.x > 0) {
	move_check_lr(_right, _top, _bottom, 2, true);
} else if (my_speed.x < 0) {
	move_check_lr(_left, _top, _bottom, 0, true);
}

// Top Bottom
// Round y speed away from 0
var _int_speed_y = my_speed.y > 0 ? ceil(my_speed.y) : floor(my_speed.y);

_left = tilemap_get_cell_x_at_pixel(wall_tilemap, bbox_left, bbox_top);
_top = tilemap_get_cell_y_at_pixel(wall_tilemap, bbox_left, bbox_top + _int_speed_y);
_right = tilemap_get_cell_x_at_pixel(wall_tilemap, bbox_right, bbox_bottom);
_bottom = tilemap_get_cell_y_at_pixel(wall_tilemap, bbox_right, bbox_bottom + _int_speed_y);

if (my_speed.y > 0) {
	move_check_tb(_bottom, _left, _right, 2, true);
} else if (my_speed.y < 0) {
	move_check_tb(_top, _left, _right, 0, true);
}

if (x != _prev_x || y != _prev_y) {
	moved = true;
}