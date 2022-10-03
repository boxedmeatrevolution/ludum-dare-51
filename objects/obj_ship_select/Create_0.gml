image_speed = 0;

if (array_length(obj_controller.racers[0]) <= 2) {
	instance_destroy(self);
}
image_index = 1;
if (index == obj_controller.racers_in_race[0].player_index) {
	image_index = 0;
}
if (index == obj_controller.racers_in_race[1].player_index) {
	image_index = 0;
}
