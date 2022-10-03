var dt = 1 / 60;
lifetime -= dt;
if (lifetime < 0) {
	instance_destroy(self);
}
image_alpha = lifetime / lifetime_max;

x = owner.x;
y = owner.y;
