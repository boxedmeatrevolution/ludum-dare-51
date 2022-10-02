var dt = 1 / 60;
var vel = 500;
x += vel * dcos(dir) * dt;
y += vel * dsin(dir) * dt;
image_angle = -dir;
lifetime += dt;
if (lifetime > 1.3) {
	image_alpha = lerp(1.0, 0.0, (lifetime - 1.3) / 0.2);
}
if (lifetime > 1.5) {
	instance_destroy(self);
}
