draw_module_card(x, y, obj_controller.scavenge_slots[slot], image_index);
if (!obj_controller.scavenge_active[slot]) {
	draw_sprite(spr_module_inactive, 0, x, y);
}
