var nearest = instance_nearest(mouse_x, mouse_y, obj_spaceship);
var delta_x = nearest.x - mouse_x;
var delta_y = nearest.y - mouse_y;
if (abs(delta_x) + abs(delta_y) < 40) {
	draw_set_color(c_white);
	draw_circle(nearest.x, nearest.y, 40, true);
	draw_set_color(c_white);
	draw_sprite(spr_racer_icon, nearest.model.team, nearest.x, nearest.y - 40);
}
