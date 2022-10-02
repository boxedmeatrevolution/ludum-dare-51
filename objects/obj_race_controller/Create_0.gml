var size = 2;
room_width = size * 1366;

start_line = 64;
finish_line = room_width - 96;

race_started = false;
race_started_timer = 3;

race_finished = false;
race_finished_timer = 2;

instance_create_layer(0, 0, "DecorationFront", obj_race_countdown);
instance_create_layer(finish_line, 0, "DecorationBack", obj_finish_line);

racers = array_create(array_length(obj_controller.racers_in_race), noone);
placement = [];

for (var i = 0; i < array_length(obj_controller.racers_in_race); ++i) {
	racers[i] = instance_create_layer(start_line, (i + 0.5) / array_length(obj_controller.racers_in_race) * room_height, "Racers", obj_spaceship);
	racers[i].racer_index = i;
	racers[i].model = obj_controller.racers_in_race[i];
	if (racers[i].model.team == 0) {
		racers[i].sprite_index = spr_spaceship;
		racers[i].image_index = racers[i].model.player_index;
	} else {
		racers[i].sprite_index = spr_spaceship_enemy;
		racers[i].image_index = racers[i].model.team;
	}
}
