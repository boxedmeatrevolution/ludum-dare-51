var dt = 1 / 60;
lifetime += dt;
if (lifetime > 1) {
	image_alpha = lerp(0.0, 1.0, (1.5 - lifetime) / 0.5);
}
if (lifetime > 1.5) {
	instance_destroy(self);
}
