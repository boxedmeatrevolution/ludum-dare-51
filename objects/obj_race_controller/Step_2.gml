var dt = 1 / 60;

array_sort(racers, function (racer1, racer2) { return racer1.x - racer2.x });

var all_dead = true;
for (var i = 0; i < array_length(racers); ++i) {
	if (!racers[i].dead && racers[i].placement == -1) {
		all_dead = false;
	}
	if (racers[i].placement == -1 && racers[i].x > finish_line) {
		racers[i].placement = array_length(placement);
		array_push(placement, racers[i]);
		if (racers[i].placement <= 2) {
			var placement_visual = instance_create_layer(finish_line - 64, clamp(racers[i].y, 64, room_height - 128), "DecorationFront", obj_placement);
			placement_visual.placement = racers[i].placement;
			placement_visual.team = racers[i].model.team;
		}
		if (racers[i].placement == 2) {
			race_finished = true;
		}
	}
}

if (all_dead) {
	race_finished = true;
}

if (race_finished) {
	race_finished_timer -= dt;
	if (race_finished_timer < 4 && instance_number(obj_indicator_your_medals) == 0) {
		instance_create_layer(x, y, "Controllers", obj_indicator_your_medals);
	}
	if (race_finished_timer < 0) {
		obj_controller.placement = [  ];
		for (var i = 0; i < min(3, array_length(placement)); ++i) {
			array_push(obj_controller.placement, placement[i].model);
		}
		room_goto(rm_scavenge);
	}
}

if (!race_started) {
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
