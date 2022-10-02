var dt = 1 / 60;
lifetime += dt;
if (lifetime > 1) {
	instance_destroy(self);
}
