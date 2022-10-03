var unused = 0 + 1 + 2;
unused -= obj_controller.racers_in_race[0].player_index;
unused -= obj_controller.racers_in_race[1].player_index;
if (index == obj_controller.racers_in_race[0].player_index) {
	obj_controller.racers_in_race[0] = obj_controller.racers[0][unused];
	image_index = 1;
	with (obj_ship_select) {
		if (index == unused) {
			image_index = 0;
		}
	}
} else if (index == obj_controller.racers_in_race[1].player_index) {
	obj_controller.racers_in_race[1] = obj_controller.racers[0][unused];
	image_index = 1;
	with (obj_ship_select) {
		if (index == unused) {
			image_index = 0;
		}
	}
} else {
	with (obj_ship_select) {
		if (index == obj_controller.racers_in_race[1].player_index) {
			image_index = 1;
		}
	}
	obj_controller.racers_in_race[1] = obj_controller.racers_in_race[0];
	obj_controller.racers_in_race[0] = obj_controller.racers[0][index];
	image_index = 0;
}
