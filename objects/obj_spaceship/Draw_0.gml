draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
for (var i = 0; i < max_hp; ++i) {
	var draw_dir = i / (max_hp) * 360 + 90 + 45 * animation_timer;
	var draw_x = x + 40 * dcos(draw_dir);
	var draw_y = y - 40 * dsin(draw_dir);
	draw_sprite(spr_shield_pip, hp > i ? 0 : 1, draw_x, draw_y);
}
