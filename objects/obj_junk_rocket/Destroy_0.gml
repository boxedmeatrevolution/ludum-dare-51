for (var i = 0; i < 15; ++i) {
	var delta = random(180);
	var theta = random(360);
	var dx = delta * dcos(theta);
	var dy = delta * dsin(theta);
	instance_create_layer(x+dx, y+dy, "Explosions", obj_explosion);
}
var hitbox = instance_create_layer(x, y, "Explosions", obj_explosion_hitbox);
hitbox.image_xscale = 180 / 32;
hitbox.image_yscale = 180 / 32;
hitbox.damage = 1;

for (var i = 0; i < 5; ++i) {
	vel_min = 50;
	vel_max = 200;
	var dir = random(360);
	var vel = random_range(vel_min, vel_max);
	var baby1 = instance_create_layer(x + 45 * dcos(dir), y + 45 * dsin(dir), "Asteroids", obj_asteroid);
	asteroid_set_type(baby1, AsteroidType.Metal);
	baby1.vel_x = vel * dcos(dir);
	baby1.vel_y = vel * dsin(dir);
}
