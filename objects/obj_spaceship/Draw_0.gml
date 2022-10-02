draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (!active) {
	shield_fade = lerp(0.0, 0.5, active_timer / active_timer_max);
	draw_sprite_ext(spr_shield, 0, x, y, image_xscale, image_yscale, image_angle, c_white, shield_fade);
}
