if (is_pressed) {
	var module = obj_controller.scavenge_slots[slot];
	if (module != noone && obj_controller.scavenge_active[slot]) {
		for (var i = 0; i < 5; ++i) {
			instance_create_layer(mouse_x, mouse_y, "Foreground", obj_gear);
		}
		var anim = instance_create_layer(x, y - 0.3 * 192, "Foreground", obj_scavenge_animation);
		if (module.type == Module.ThrusterModule) {
			obj_controller.racers[0][obj_scavenge_spaceship_large.index].thruster = module;
			with (obj_module_slot) {
				if (type == "Thruster") {
					anim.target = self;
					anim.image_index = 0;
				}
			}
		}
		if (module.type == Module.ShieldModule) {
			obj_controller.racers[0][obj_scavenge_spaceship_large.index].shield = module;
			with (obj_module_slot) {
				if (type == "Shield") {
					anim.target = self;
					anim.image_index = 1;
				}
			}
		}
		if (module.type == Module.LaserModule) {
			obj_controller.racers[0][obj_scavenge_spaceship_large.index].laser = module;
			with (obj_module_slot) {
				if (type == "Laser") {
					anim.target = self;
					anim.image_index = 2;
				}
			}
		}
		obj_controller.scavenge_slots[slot] = noone;
		obj_controller.scavenge_active[slot] = false;

		var any_active = false;
		for (var i = 0; i < 3; ++i) {
			if (obj_controller.scavenge_active[i]) {
				any_active = true;
			}
		}
		if (!any_active) {
			obj_scavenge_timer.sprite_index = spr_scavenge_timer_start_race;
			obj_scavenge_timer.image_speed = 1;
		}
	}
}