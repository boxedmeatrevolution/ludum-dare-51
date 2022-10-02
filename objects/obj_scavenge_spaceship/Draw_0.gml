draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (active) {
	draw_set_color(c_yellow);
	draw_circle(x, y, 48, true);
	draw_set_color(c_white);
}
