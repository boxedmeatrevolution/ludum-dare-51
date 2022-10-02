if (owner == other || lifetime < 0.25) {
	exit;
}

var delta_x = x - other.x;
var delta_y = y - other.y;
var distance = sqrt(sqr(delta_x) + sqr(delta_y));
other.vel_x = 30 * delta_x / distance;
other.vel_y = 30 * delta_y / distance;
other.vel_dir += random_range(-20, 20);

other.hp -= 1;
other.active = false;
other.active_timer = other.active_timer_max;

instance_destroy(self);
