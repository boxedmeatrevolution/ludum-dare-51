if (obj_controller.race_index != 1) {
	start_pos = -670;
	end_pos = -10;
	percent_progress = 1 - obj_scavenge_timer.timer / obj_scavenge_timer.max_timer;
	current_pos = lerp(start_pos, end_pos, percent_progress);

	if (!surface_exists(clip_surface)) {
		clip_surface = surface_create(32, 685);
	}

	surface_set_target(clip_surface);
	draw_sprite(spr_timer_progress_bar, 2, 0, current_pos);
	gpu_set_blendmode(bm_subtract);
	draw_sprite(spr_timer_progress_bar, 1, 0, 0);
	gpu_set_blendmode(bm_normal);
	draw_sprite(spr_timer_progress_bar, 0, 0, 0);
	surface_reset_target();

	draw_sprite(spr_timer_progress_bar, 3, x, y);
	draw_surface(clip_surface, x, y);
}






