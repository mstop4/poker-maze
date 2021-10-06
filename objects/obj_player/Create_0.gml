scr_player();

function draw_me() {
	draw_sprite(sprite_index, image_index, floor(x), floor(y));
}

wall_tilemap = layer_tilemap_get_id("Walls");
border_tilemap = layer_tilemap_get_id("Border");

my_speed = new Vector2(0, 0);
my_state = PLAYER_STATE.OK;
moved = false;