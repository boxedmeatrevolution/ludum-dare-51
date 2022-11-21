if (race_started && !race_finished) {
	var camera_x = camera_get_view_x(view_camera[0]);
	instance_create_layer(camera_x - 64, mouse_y, "JunkRockets", obj_junk_rocket);
}
