instance_create_layer(x, y, "Explosions", obj_explosion);
for (var i = 0; i < 10; ++i) {
	instance_create_layer(x, y, "Asteroids", obj_dust);
}

if (type == AsteroidType.Large) {
	vel_min = 50;
	vel_max = 200;
	
	var baby1 = instance_create_layer(x, y, "Asteroids", obj_asteroid);
	asteroid_set_type(baby1, AsteroidType.Normal);
	var dir = random(360);
	var vel = random_range(vel_min, vel_max);
	baby1.vel_x = vel * dcos(dir);
	baby1.vel_y = vel * dsin(dir);
	
	var baby2 = instance_create_layer(x, y, "Asteroids", obj_asteroid);
	asteroid_set_type(baby2, AsteroidType.Normal);
	var dir = random(360);
	var vel = random_range(vel_min, vel_max);
	baby2.vel_x = vel * dcos(dir);
	baby2.vel_y = vel * dsin(dir);
}