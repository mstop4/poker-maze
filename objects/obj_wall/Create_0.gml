function draw_me() {
	draw_sprite(spr_wall, image_index, x, y);
}

var _layer_id = layer_get_id("Walls");
wall_tile_layer = layer_tilemap_get_id(_layer_id);

var _tile = tilemap_get_at_pixel(wall_tile_layer, x, y);
_tile = tile_set_index(_tile, 1);
tilemap_set_at_pixel(wall_tile_layer, _tile, x, y);

/*mp_tile = new Vector2(x div global.cell_size, y div global.cell_size);
mp_grid_add_cell(obj_room_controller.mp_grid, mp_tile.x, mp_tile.y);*/