if (!active) {
	with (obj_scavenge_spaceship) {
		active = false;
	}
	active = true;
	obj_scavenge_spaceship_large.index = index;
	obj_scavenge_spaceship_large.swap = true;
	obj_scavenge_spaceship_large.swap_timer = obj_scavenge_spaceship_large.swap_timer_max;
}
