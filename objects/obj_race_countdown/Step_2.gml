var dt = 1 / 60;
if (obj_race_controller.race_started) {
	sprite_index = spr_race_go;
} else {
	sprite_index = spr_race_countdown;
	image_index = floor(obj_race_controller.race_started_timer);
}
lifetime -= dt;
if (lifetime < 0) {
	instance_destroy(self);
}
