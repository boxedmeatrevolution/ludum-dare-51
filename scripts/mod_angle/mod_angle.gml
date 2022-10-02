function mod_angle(arg) {
	while (arg > 180) {
		arg -= 360;
	}
	while (arg < -180) {
		arg += 180;
	}
	return arg;
}
