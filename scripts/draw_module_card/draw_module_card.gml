function draw_module_card(xx, yy, module) {
	var width = 192;
	var height = 192;
	draw_sprite(spr_module_card, 0, xx, yy);
	var img = noone;
	var name = "";
	if (module == noone) {
		return;
	}
	switch (module.type) {
		case Module.LaserModule:
			img = spr_laser;
			name = "Laser";
			break;
		case Module.ShieldModule:
			img = spr_shield;
			name = "Shield";
			break;
		case Module.ThrusterModule:
			img = spr_asteroid;
			name = "Thruster";
			break;
	}
	draw_sprite(img, 0, xx, yy - 0.25 * height);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(xx, yy + 0.05 * height, name);
	for (var i = 1; i <= 3; ++i) {
		var star_x = xx + 32 * (i - 2);
		var star_y = yy + 0.2 * height;
		draw_sprite(spr_star, module.rating >= i ? 0 : 1, star_x, star_y);
	}
	if (array_length(module.abilities) == 0) {
		draw_text(xx, yy + 0.35 * height, "Standard");
	}
	for (var i = 0; i < array_length(module.abilities); i += 1) {
		draw_text(xx, yy + 0.35 * height + 0.1 * i * height, ability_to_string(module, i));
	}
}
