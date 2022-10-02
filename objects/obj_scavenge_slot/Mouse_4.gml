var module = obj_controller.scavenge_slots[slot];
if (module != noone && obj_controller.scavenge_active[slot]) {
	if (module.type == Module.ThrusterModule) {
		obj_controller.racers[0][obj_scavenge_spaceship_large.index].thruster = module;
	}
	if (module.type == Module.ShieldModule) {
		obj_controller.racers[0][obj_scavenge_spaceship_large.index].shield = module;
	}
	if (module.type == Module.LaserModule) {
		obj_controller.racers[0][obj_scavenge_spaceship_large.index].laser = module;
	}
	obj_controller.scavenge_slots[slot] = noone;
	obj_controller.scavenge_active[slot] = noone;
}
