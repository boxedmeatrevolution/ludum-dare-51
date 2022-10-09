var module = obj_controller.scavenge_slots[slot];
var is_active_with_module = (module != noone && obj_controller.scavenge_active[slot]);

if (is_pressed && is_active_with_module) {
	image_index = 3;
}
else if (is_hovered && is_active_with_module) {
	image_index = 1
} else {
	image_index = 0;
}

draw_module_card(x, y, obj_controller.scavenge_slots[slot], image_index);
if (!obj_controller.scavenge_active[slot]) {
	draw_sprite(spr_module_inactive, 0, x, y);
}
