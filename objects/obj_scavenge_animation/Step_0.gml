var dt = 1 / 60;
var target_x = target.x;
var target_y = target.y - 0.3 * 192;
timer += dt;
var progress = 0.5 * (1 - cos(pi * timer / animation_time));
x = lerp(origin_x, target_x, progress);
y = lerp(origin_y, target_y, progress);
if (timer > animation_time) {
	instance_destroy(self);
}
