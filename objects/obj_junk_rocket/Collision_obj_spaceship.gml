if (!other.dead && x > camera_get_view_x(view_camera[0]) + 32) {
	instance_destroy(self);
}
