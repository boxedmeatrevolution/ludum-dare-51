var dt = 1 / 60;

timer += dt;
timer_drop += dt;
if (timer_drop > 0.6) {
	timer_drop = 100;
	image_alpha = 1;
	image_xscale = 1;
	image_yscale = 1;
} else {
	var lt = timer_drop / 0.6;
	image_alpha = lerp(0, 1, lt);
	image_xscale = 1 / lt;
	image_yscale = 1 / lt;
}

var target_y = mouse_y;
var t = timer / 10;
var target_x = camera_get_view_width(view_camera[0]) * lerp(t, t * t, 0.3) + camera_get_view_x(view_camera[0]);

if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) {
	instance_destroy(self);
}

vel_x += 10 * (target_x - x) * dt;
vel_x -= 7 * vel_x * dt;

vel_y += 350 * clamp((target_y - y) / 500, -1, 1) * dt;
vel_y -= 1.4 * vel_y * dt;
/*if (abs(vel_y) > 0.9 * abs(vel_x)) {
	vel_y = sign(vel_y) * 0.9 * abs(vel_x);
}*/

x += vel_x * dt;
y += vel_y * dt;

var dir = mod_angle(darctan2(vel_y, vel_x));
image_angle = -dir;

if (y < 0) {
	vel_y = abs(vel_y);
	//dir = abs(dir);
}
if (y > room_height) {
	vel_y = -abs(vel_y);
	//dir = -abs(dir);
}
