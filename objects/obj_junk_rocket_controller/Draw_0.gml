if (loaded) {
	var lt = (loaded_timer % 0.9) / 0.9;
	var lt2 = ((loaded_timer + 0.45) % 0.9) / 0.9;
	var camera_x = camera_get_view_x(view_camera[0]);
	var camera_width = camera_get_view_width(view_camera[0]);
	gpu_set_blendmode(bm_add);
	draw_set_color(c_red);
	var yy = choose(-1, 0, 1);
	draw_line(camera_x, mouse_y + yy, camera_x + camera_width, mouse_y + yy);
	draw_sprite_ext(spr_junk_rocket, 0, camera_x + lerp(0, camera_width, lt), mouse_y, 1, 1, 0, c_red, 0.25);
	draw_sprite_ext(spr_junk_rocket, 0, camera_x + lerp(0, camera_width, lt2), mouse_y, 1, 1, 0, c_red, 0.25);
	draw_set_color(c_white);
	gpu_set_blendmode(bm_normal);
}
