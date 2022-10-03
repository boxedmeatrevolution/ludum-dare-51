density = 25 / (1366 * 768);
vel_min = 5;
vel_max = 20;

var room_area = (room_width - 300) * room_height;
var count = round(room_area * density);
var lanes = array_length(obj_controller.racers_in_race);
var count_per_lane = round(count / lanes);
for (var i = 0; i < lanes; ++i) {
	for (var j = 0; j < count_per_lane; ++j) {
		var asteroid = instance_create_layer(random_range(300, room_width), random_range(i / lanes, (i + 1) / lanes) * room_height, "Asteroids", obj_asteroid);
		asteroid_set_type(asteroid, AsteroidType.Spicy);
		var dir = random(360);
		var vel = random_range(vel_min, vel_max);
		asteroid.vel_x = vel * dcos(dir);
		asteroid.vel_y = vel * dsin(dir);
	}
}
