draw_module_card(x, y, obj_controller.scavenge_slots[slot], image_index);
if (obj_controller.scavenge_slots[slot] != noone) {
	for (var i = 0; i < obj_controller.scavenge_slots[slot].cost; ++i) {
		draw_sprite(spr_coin_small, 0, x - 0.5 * 192 + 24, y + 24 - 0.5 * 192 + i * 12);
	}
}
if (!obj_controller.scavenge_active[slot]) {
	draw_sprite(spr_module_inactive, 0, x, y);
}
