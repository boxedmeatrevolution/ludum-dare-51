function erf(arg) {
	if (arg < 0) {
		arg = -arg;
	}
	var a1 = 0.278393;
	var a2 = 0.230389;
	var a3 = 0.000972;
	var a4 = 0.078108;
	return 1 - 1 / power(1 + a1 * arg + a2 * sqr(arg) + a3 * arg * sqr(arg) + a4 * sqr(sqr(arg)), 4);
}