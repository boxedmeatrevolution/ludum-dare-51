var size = obj_controller.race_length;
if (size == 1) {
	size = 1.4;
}
room_width = size * 1366;

start_line = 64;
finish_line = room_width - 148;

race_started = false;
race_started_timer = 3;

race_finished = false;
race_finished_timer = 5;

instance_create_layer(0, 0, "DecorationFront", obj_race_countdown);
instance_create_layer(finish_line, 0, "DecorationBack", obj_finish_line);

racers = array_create(array_length(obj_controller.racers_in_race), noone);
placement = [];

var permutation = [ choose(0, 1, 2), choose(0, 1, 2), choose(0, 1, 2) ];
while (permutation[1] == permutation[0]) {
	permutation[1] = choose(0, 1, 2);
}
permutation[2] = 0 + 1 + 2 - permutation[0] - permutation[1];
var perm_start = choose(
	[ 2 * permutation[0], 2 * permutation[0] + 1, 2 * permutation[1], 2 * permutation[1] + 1, 2 * permutation[2], 2 * permutation[2] + 1 ],
	[ 2 * permutation[0], 2 * permutation[1], 2 * permutation[2], 2 * permutation[0] + 1, 2 * permutation[1] + 1, 2 * permutation[2] + 1 ]
);
for (var i = 0; i < array_length(obj_controller.racers_in_race); ++i) {
	racers[i] = instance_create_layer(start_line, (perm_start[i] + 0.5) / 6 * room_height, "Racers", obj_spaceship);
	racers[i].racer_index = i;
	spaceship_set_model(racers[i], obj_controller.racers_in_race[i]);
	if (racers[i].model.player_index != -1) {
		var indic = instance_create_layer(racers[i].x, racers[i].y, "Controllers", obj_indicator_your_racer);
		indic.target = racers[i];
	}
	if (racers[i].model.team == 0) {
		racers[i].sprite_index = spr_spaceship;
		racers[i].image_index = racers[i].model.player_index;
	} else {
		racers[i].sprite_index = spr_spaceship_enemy;
		racers[i].image_index = racers[i].model.team - 1;
	}
}

with (obj_spaceship) {
	with (obj_spaceship) {
		if (other != self && other.model.team == self.model.team) {
			ally = other;
		}
	}
}
