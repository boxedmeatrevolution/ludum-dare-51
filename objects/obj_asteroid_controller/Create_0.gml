vel_min = 5;
vel_max = 20;

densities[AsteroidType.Normal] = 20 / (1366 * 768);
densities[AsteroidType.Metal] = 10 / (1366 * 768);
densities[AsteroidType.Large] = 12 / (1366 * 768);
densities[AsteroidType.Icy] = 14 / (1366 * 768);
densities[AsteroidType.Spicy] = 14 / (1366 * 768);
densities[AsteroidType.Rubber] = 20 / (1366 * 768);

for (var n = 0; n < array_length(obj_controller.environment); ++n) {
	var room_area = (room_width - 300) * room_height;
	var count = round(room_area * densities[obj_controller.environment[n]]);
	var lanes = array_length(obj_controller.racers_in_race);
	var count_per_lane = round(count / lanes);
	for (var i = 0; i < lanes; ++i) {
		for (var j = 0; j < count_per_lane; ++j) {
			var asteroid = instance_create_layer(random_range(300, room_width), random_range(i / lanes, (i + 1) / lanes) * room_height, "Asteroids", obj_asteroid);
			asteroid_set_type(asteroid, obj_controller.environment[n]);
			var dir = random(360);
			var vel = random_range(vel_min, vel_max);
			asteroid.vel_x = vel * dcos(dir);
			asteroid.vel_y = vel * dsin(dir);
		}
	}
}
