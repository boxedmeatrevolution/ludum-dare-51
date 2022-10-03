var dt = 1 / 60;
timer -= dt;
if (sprite_index == spr_scavenge_timer) {
	image_index = floor(timer);
}

if (sprite_index == spr_scavenge_timer && timer < 0) {
	timer = 11;
	var any_active = false;
	var first = true;
	for (var i = 0; i < 3; ++i) {
		if (obj_controller.scavenge_active[i]) {
			if (first) {
				obj_controller.scavenge_active[i] = false;
				first = false;
			} else {
				any_active = true;
			}
		}
	}
	if (!any_active) {
		sprite_index = spr_scavenge_timer_start_race;
		image_speed = 1;
	}
}


