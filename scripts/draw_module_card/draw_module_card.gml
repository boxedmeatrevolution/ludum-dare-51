function draw_module_card(xx, yy, module, img_idx_sl) {
	var width = 192;
	var height = 192;
	draw_sprite(spr_module_card, img_idx_sl, xx, yy);
	var img_idx = noone;
	var name = "";
	if (module == noone) {
		return;
	}
	switch (module.type) {
		case Module.LaserModule:
			img_idx = 2;
			name = "Laser";
			break;
		case Module.ShieldModule:
			img_idx = 1;
			name = "Shield";
			break;
		case Module.ThrusterModule:
			img_idx = 0;
			name = "Thruster";
			break;
	}
	draw_sprite(spr_module_icon, img_idx, xx, yy - 0.30 * height);
	draw_set_font(fnt_main);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	draw_text(xx + 2, yy - 0.25 * height, name);
	draw_text(xx - 2, yy - 0.25 * height, name);
	draw_text(xx, yy + 2 - 0.25 * height, name);
	draw_text(xx, yy - 2 - 0.25 * height, name);
	draw_set_color(c_black);
	draw_text(xx, yy - 0.25 * height, name);
	draw_set_color(c_white);
	for (var i = 1; i <= 3; ++i) {
		var star_x = xx + 32 * (i - 2);
		var star_y = yy - 0.05 * height;
		draw_sprite(spr_star, module.rating >= i ? 0 : 1, star_x, star_y);
	}
	if (array_length(module.abilities) == 0) {
		draw_text(xx, yy + 0.15 * height, "Standard");
	}
	for (var i = 0; i < array_length(module.abilities); i += 1) {
		draw_text(xx, yy + 0.15 * height + 0.1 * i * height, ability_to_string(module, i));
	}
}
