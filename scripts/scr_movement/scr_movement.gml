function move_check_lr(_side, _top, _bottom, _offset, _stop_on_collision) {
	var _col = false;
	
	for (var i=_top; i<=_bottom; i++) {
		if (tile_get_index(tilemap_get(border_tilemap, _side, i) > 0)
			|| tile_get_index(tilemap_get(wall_tilemap, _side, i) > 0)) {
			_col = true;
			break;
		}
	}
	
	if (!_col) {
		x += my_speed.x;
	} else {
		x = floor(x / global.cell_size + 0.5) * global.cell_size + _offset;
		if (_stop_on_collision) my_speed.x = 0;
	}
	
	return _col;
}

function move_check_tb(_side, _left, _right, _offset, _stop_on_collision) {
	var _col = false;
	
	for (var i=_left; i<=_right; i++) {
		if (tile_get_index(tilemap_get(border_tilemap, i, _side) > 0)
			|| tile_get_index(tilemap_get(wall_tilemap, i, _side) > 0)) {
			_col = true;
			break;
		}
	}
	
	if (!_col) {
		y += my_speed.y;
	} else {
		y = floor(y / global.cell_size + 0.5) * global.cell_size + _offset;
		if (_stop_on_collision) my_speed.y = 0;
	}
	
	return _col;
}