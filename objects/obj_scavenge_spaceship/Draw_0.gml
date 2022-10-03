if (!active) {
	draw_sprite(spr_scavenge_spaceship_background, image_index, x, y);
} else {
	draw_sprite(spr_scavenge_spaceship_background, 2, x, y);
}
draw_sprite_ext(spr_spaceship, index, x, y, 1, 1, 90, c_white, 1);
