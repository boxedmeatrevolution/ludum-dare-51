var xx = 0.5 * camera_get_view_width(view_camera[view_current]);
var yy = 0.4 * camera_get_view_height(view_camera[view_current]);
draw_set_alpha(image_alpha);
draw_sprite(sprite_index, 0, xx, yy);
var num_medals = array_length(player_medals);
for (var i = 0; i < num_medals; ++i) {
	var draw_x = xx + (i - 0.5 * num_medals + 0.5) * 192;
	var draw_y = yy + 192;
	draw_sprite(spr_placement, player_medals[i], draw_x, draw_y);
}
if (array_length(player_medals) == 0) {
	draw_sprite(spr_participation, 0, xx, yy + 192)
}
draw_set_alpha(1);
