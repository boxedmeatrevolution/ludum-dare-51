swap = false;
swap_timer_max = 0.2;
if (index >= array_length(obj_controller.racers[0])) {
	instance_destroy(self);
}
image_speed = 0;
image_index = index;
active = index == 0;
