var dt = 1 / 60;
x = target.x;
y = target.y;

lifetime -= dt;

if (lifetime < 0.5) {
	image_alpha = lerp(0.0, 1.0, lifetime / 0.5);
}
if (lifetime < 0) {
	instance_destroy(self);
}
