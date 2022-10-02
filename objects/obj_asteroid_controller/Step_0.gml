var dt = 1 / 60;
var vel = random_range(vel_min, vel_max);
var dir = random(360);
var padding = 64;
var vel_x = vel * dcos(dir);
var vel_y = vel * dsin(dir);
if (random(1) < 2 * density * (room_width + 2 * padding) * abs(vel_y) * dt) {
	var asteroid = instance_create_layer(random_range(-padding, room_width + padding), vel_y > 0 ? -padding : room_height + padding, "Asteroids", obj_asteroid);
	asteroid.vel_x = vel_x;
	asteroid.vel_y = vel_y;
}
if (random(1) < 2 * density * (room_height + 2 * padding) * abs(vel_x) * dt) {
	var asteroid = instance_create_layer(vel_x > 0 ? -padding : room_width + padding, random_range(-padding, room_height + padding), "Asteroids", obj_asteroid);
	asteroid.vel_x = vel_x;
	asteroid.vel_y = vel_y;
}
