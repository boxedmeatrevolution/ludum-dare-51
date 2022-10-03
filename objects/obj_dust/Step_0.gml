var dt = 1 / 60;
image_alpha -= dt / 1;
if (image_alpha < 0) {
	instance_destroy(self);
}
image_angle += 30 * dt;
x += vel_x * dt;
y += vel_y * dt;
