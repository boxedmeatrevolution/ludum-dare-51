var dt = 1 / 60;

array_sort(racers, function (racer1, racer2) { return racer1.x - racer2.x });

var all_dead = true;
for (var i = 0; i < array_length(racers); ++i) {
	if (!racers[i].dead && racers[i].placement == -1) {
		all_dead = false;
	}
	racers[i].placement_temp = array_length(racers) - i - 1;
	if (!racers[i].dead && racers[i].placement == -1 && racers[i].x > finish_line) {
		racers[i].placement = array_length(placement);
		array_push(placement, racers[i]);
		if (racers[i].placement <= 2) {
			var placement_visual = instance_create_layer(finish_line - 64, clamp(racers[i].y, 64, room_height - 128), "DecorationFront", obj_placement);
			placement_visual.placement = racers[i].placement;
			placement_visual.team = racers[i].model.team;
		}
		if (racers[i].placement == 2) {
			race_finished = true;
			var sounds = [ snd_race1, snd_race2, snd_race3 ];
			audio_sound_gain(sounds[obj_controller.race_index % 3], 0, 3000);
		}
	}
}

if (all_dead) {
	race_finished = true;
	var sounds = [ snd_race1, snd_race2, snd_race3 ];
	audio_sound_gain(sounds[obj_controller.race_index % 3], 0, 3000);
}

if (race_finished) {
	if (race_finished_phase == 0) {
		race_finished_timer -= dt;
		if (race_finished_timer < 0) {
			race_finished_phase = 1;
			instance_create_layer(x, y, "Controllers", obj_indicator_your_medals);
		}
	} else if (race_finished_phase == 1) {
		if (!instance_exists(obj_indicator_your_medals)) {
			race_finished_phase = 2;
			instance_create_layer(x, y, "Controllers", obj_indicator_ships_lost);
		}
	} else if (race_finished_phase == 2) {
		if (!instance_exists(obj_indicator_ships_lost)) {
			race_finished_phase = 3;
		}
	} else if (race_finished_phase == 3) {
		obj_controller.placement = [  ];
		for (var i = 0; i < min(3, array_length(placement)); ++i) {
			array_push(obj_controller.placement, placement[i].model);
		}
		race_finished_phase = 4;
		var talker = instance_create_layer(x, y, "Controllers", obj_character_speech);
		talker.dialogue = [
			"The race is all done.",
			"Maybe your ships got all smashed up!",
			"That would be too bad, wouldn't it?"
		];
	} else if (race_finished_phase == 4) {
		if (!instance_exists(obj_character_speech)) {
			if (obj_controller.race_index == 1 || obj_controller.race_index == 2 || obj_controller.race_index == 3 || obj_controller.race_index == 4) {
				room_goto(rm_tutorial);
			} else {
				room_goto(rm_scavenge);
			}
		}
	}
}

if (!race_started && !instance_exists(obj_character_speech)) {
	race_started_timer -= dt;
	if (race_started_timer < 0) {
		race_started = true;
	}
}

var camera_x = camera_get_view_x(view_camera[0]);
var camera_width = camera_get_view_width(view_camera[0]);
var target_x = racers[array_length(racers) - 1].x - 0.75 * camera_width;
var new_camera_x = (camera_x - target_x) * (exp(-dt / 0.5)) + target_x;
new_camera_x = clamp(new_camera_x, 0, room_width - camera_width);
camera_set_view_pos(view_camera[0], new_camera_x, 0);
