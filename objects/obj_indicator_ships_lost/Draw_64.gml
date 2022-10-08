var xx = 0.5 * camera_get_view_width(view_camera[view_current]);
var yy = 0.25 * camera_get_view_height(view_camera[view_current]);
draw_set_alpha(image_alpha);
draw_sprite(sprite_index, 0, xx, yy);

var num_lost = array_length(player_lost_ships);
for (var i = 0; i < num_lost; ++i) {
	var draw_x = xx + (i - 0.5 * num_lost + 0.5) * (640 + 32);
	var draw_y = yy + 128 + 32;
	draw_sprite(spr_spaceship, player_lost_ships[i], draw_x, draw_y);
	draw_sprite(spr_explosion, 2, draw_x - 32, draw_y - 10);
	draw_sprite(spr_explosion, 3, draw_x + 20, draw_y - 24);
	draw_sprite(spr_explosion, 4, draw_x + 4, draw_y + 32);
	var num_modules = array_length(player_lost_modules[i]);
	for (var j = 0; j < num_modules; ++j) {
		var draw_x1 = draw_x + (j - 0.5 * num_modules + 0.5) * (192 + 16);
		var draw_y1 = draw_y + 128 + 64;
		draw_module_card(draw_x1, draw_y1, player_lost_modules[i][j], 0);
		draw_sprite(spr_explosion, (1 + j) % 3 + 2, draw_x1 - 32, draw_y1 - 10 - 48);
		draw_sprite(spr_explosion, (2 + j) % 3 + 2, draw_x1 + 20, draw_y1 - 24 - 48);
		draw_sprite(spr_explosion, (3 + j) % 3 + 2, draw_x1 + 4, draw_y1 + 32 - 48);
	}
}

draw_set_alpha(1);
