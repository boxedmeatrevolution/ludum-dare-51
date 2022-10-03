swap = false;
swap_timer_max = 0.2;
if (index >= array_length(obj_controller.racers[0])) {
	instance_destroy(self);
}
image_speed = 0;
image_index = position_meeting(mouse_x, mouse_y, self);
active = index == 0;
