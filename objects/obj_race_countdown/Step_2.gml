var dt = 1 / 60;
if (instance_exists(obj_character_speech)) {
	visible = false;
} else {
	visible = true;
}
if (obj_race_controller.race_started) {
	sprite_index = spr_race_go;
} else {
	sprite_index = spr_race_countdown;
	image_index = clamp(floor(obj_race_controller.race_started_timer), 0, 2);
}
if (!instance_exists(obj_character_speech)) {
	lifetime -= dt;
}
if (lifetime < 0) {
	instance_destroy(self);
}
