if (!clicked) {
	// Blinky to indicate player should click
	image_speed = 1;
}
else if (is_pressed) {
	image_speed = 0;
	image_index = 1;
}
else {
	image_speed = 0;
	image_index = 0;
}




