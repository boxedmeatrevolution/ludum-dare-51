if (lifetime < 0.3 || other.x <= camera_get_view_x(view_camera[0]) + 32) {
	exit;
}

instance_destroy(self);
instance_destroy(other);
