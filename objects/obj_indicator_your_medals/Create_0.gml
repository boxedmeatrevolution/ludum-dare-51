lifetime = 4;
image_alpha = 0;

var money = 0;
var pl = obj_race_controller.placement;
player_medals = [];
for (var i = 0; i < array_length(pl); ++i) {
	if (pl[i].model.player_index != -1) {
		array_push(player_medals, i);
		money += (i == 0 ? 20 : (i == 1 ? 10 : (i == 2 ? 5 : 0)));
	}
}
var left = camera_get_view_x(view_camera[0]);
var right = left + camera_get_view_width(view_camera[0]);
for (var i = 0; i < money; ++i) {
	instance_create_layer(random_range(left + 400, right - 400), room_height / 2 + random_range(-128, 128), "Controllers", obj_money);
}
