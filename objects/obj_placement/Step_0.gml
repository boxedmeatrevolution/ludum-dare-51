var dt = 1 / 60;
lifetime += dt;
if (lifetime > 1.5) {
	image_alpha = lerp(0.0, 1.0, (2 - lifetime) / 0.5);
}
if (lifetime > 2) {
	instance_destroy(self);
}
