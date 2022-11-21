var dt = 1 / 60;
if (loaded) {
	loaded_timer += dt;
	if (!obj_race_controller.race_started || obj_race_controller.race_finished) {
		loaded = false;
	}
}
