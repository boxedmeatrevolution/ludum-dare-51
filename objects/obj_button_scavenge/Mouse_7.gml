image_index = 0;
for (var i = 0; i < 10; ++i) {
	instance_create_layer(mouse_x, mouse_y, "Foreground", obj_gear);
}
for (var i = 0; i < 3; ++i) {
	var next_type = choose(Module.LaserModule, Module.ShieldModule, Module.ThrusterModule);
	var module = noone;
	switch (next_type) {
		case Module.LaserModule:
			module = new Laser(1, 1);
			break;
		case Module.ShieldModule:
			module = new Shield(1, 1);
			break;
		case Module.ThrusterModule:
			module = new Thruster(1, 1);
			break;
	}
	module.fill_random();
	obj_controller.scavenge_slots[i] = module;
}
