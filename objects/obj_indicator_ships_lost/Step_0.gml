var dt = 1 / 60;
lifetime -= dt;
if (lifetime > lifetime_max - 0.3) {
	image_alpha = lerp(0.0, 1.0, (lifetime_max - lifetime) / 0.3);
} else if (lifetime < 0.0) {
	instance_destroy(self);
} else if (lifetime < 0.3) {
	image_alpha = lifetime / 0.3;
} else {
	image_alpha = 1;
}
