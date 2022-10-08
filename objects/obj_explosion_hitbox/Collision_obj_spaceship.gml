for (var i = 0; i < array_length(hit); ++i) {
	if (hit[i] == other) {
		exit;
	}
}
array_push(hit, other);

var delta_x = x - other.x;
var delta_y = y - other.y;
var distance = sqrt(sqr(delta_x) + sqr(delta_y));
other.vel_x = 30 * delta_x / distance;
other.vel_y = 30 * delta_y / distance;
other.vel_dir += random_range(-20, 20);
	
other.hp -= 1
other.active = false;
other.active_timer = other.active_timer_max;
	