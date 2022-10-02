var dt = 1 / 60;
if (swap) {
	swap_timer -= dt;
	image_alpha = abs(swap_timer) / swap_timer_max;
	if (swap_timer < 0) {
		image_index = index;
	}
	if (swap_timer < -swap_timer_max) {
		swap = false;
		image_alpha = 1;
	}
}
