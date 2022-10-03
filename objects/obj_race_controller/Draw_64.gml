var width = camera_get_view_width(view_camera[view_current]);
var height = camera_get_view_height(view_camera[view_current]);
var origin_x = 0;
var origin_y = 0;
draw_roundrect_ext(origin_x + 32, origin_y + height - 32 - 8, origin_x + width - 32, origin_y + height - 32, 8, 8, false);
for (var i = 0; i < array_length(racers); ++i) {
	if (racers[i].placement == -1) {
		var pos = (racers[i].x - start_line) / (finish_line - start_line);
		if (racers[i].dead) {
			draw_sprite(spr_racer_dead_icon, racers[i].model.team, lerp(origin_x + 32, origin_x + width - 32, pos), origin_y + height - 32 - 4);
		} else {
			draw_sprite(spr_racer_icon, racers[i].model.team, lerp(origin_x + 32, origin_x + width - 32, pos), origin_y + height - 32 - 4);
		}
	}
}
