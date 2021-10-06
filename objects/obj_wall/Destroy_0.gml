var _tile = tilemap_get_at_pixel(wall_tile_layer, x, y);
_tile = tile_set_index(_tile, 0);
tilemap_set_at_pixel(wall_tile_layer, _tile, x, y);

mp_grid_clear_cell(obj_room_controller.mp_grid, mp_tile.x, mp_tile.y);