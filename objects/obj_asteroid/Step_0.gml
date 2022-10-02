var dt = 1 / 60;
x += vel_x * dt;
y += vel_y * dt;
image_angle += vel_dir * dt;

if (hp <= 0) {
	instance_destroy(self);
}

if (bbox_right < 0 && vel_x < 0) {
	instance_destroy(self);
}
if (bbox_left > room_width && vel_x > 0) {
	instance_destroy(self);
}
if (bbox_bottom < 0 && vel_y < 0) {
	instance_destroy(self);
}
if (bbox_top > room_height && vel_y > 0) {
	instance_destroy(self);
}
