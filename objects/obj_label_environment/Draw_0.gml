draw_sprite(sprite_index, 0, x, y);
for (var i = 0; i < array_length(obj_controller.environment); ++i) {
	draw_sprite(sprites[obj_controller.environment[i]], 0, x + 40 + 28 * i, y + 54 + 8 * i);
}
