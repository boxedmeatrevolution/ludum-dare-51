var dt = 1 / 60;

var is_countdown = obj_controller.race_index != 1 && obj_button_scavenge.clicked
var no_active_scavenge = !obj_controller.scavenge_active[0] 
                      && !obj_controller.scavenge_active[1] 
                      && !obj_controller.scavenge_active[2];

// Countdown
if (is_countdown) {
	if (obj_controller.race_index <= 2) {
		timer -= 0.5 * dt;
	} else {
		timer -= 0.7 * dt;
	}
}

// Logic
if (!obj_button_scavenge.clicked) {
	// Disabled button (force player to scavenge once)
	sprite_index = spr_scavenge_timer;
	image_index = 0;
	image_speed = 0;
}
else if (no_active_scavenge) {
	// Show "Race" button, blinking
	sprite_index = spr_scavenge_timer_start_race;
	image_speed = 1;
}
else if (is_pressed) {
	// Show "Race" button, pressed
	sprite_index = spr_scavenge_timer_start_race;
	image_index = 0;
	image_speed = 0;
}
else if (is_hovered || !is_countdown) {
	// Show "Race" button, no blinking, unpressed
	sprite_index = spr_scavenge_timer_start_race;
	image_index = 1;
	image_speed = 0;
}
else if (is_countdown) {
	// Show countdown
	sprite_index = spr_scavenge_timer;
	image_index = floor(timer);
	if (timer < 0) {
		timer = 11;
		for (var i = 0; i < 3; ++i) {
			if (obj_controller.scavenge_active[i]) {
				obj_controller.scavenge_active[i] = false;
				break;
			}
		}
	}
}
