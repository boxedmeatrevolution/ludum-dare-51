lifetime_max = 1000000;
lifetime = lifetime_max;
image_alpha = 0;

player_lost_ships = [];
player_lost_modules = [];
with (obj_spaceship) {
	if (model.team == 0 && ship_lost) {
		var next_modules = [];
		for (var i = 0; i < array_length(ship_lost_modules); ++i) {
			array_push(next_modules, ship_lost_modules[i]);
		}
		array_push(other.player_lost_modules, next_modules);
		array_push(other.player_lost_ships, model.player_index);
	}
}

if (array_length(player_lost_ships) == 0) {
	instance_destroy(self);
}
