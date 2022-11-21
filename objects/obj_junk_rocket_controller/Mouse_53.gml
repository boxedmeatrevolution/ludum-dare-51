if (obj_race_controller.race_started && !obj_race_controller.race_finished) {
	if (!loaded) {
		if (!instance_exists(obj_junk_rocket)) {
			loaded = true;
			loaded_timer = 0;
		}
	} else {
		var camera_x = camera_get_view_x(view_camera[0]);
		instance_create_layer(camera_x - 64, mouse_y, "JunkRockets", obj_junk_rocket);
		loaded = false;
	}
}
