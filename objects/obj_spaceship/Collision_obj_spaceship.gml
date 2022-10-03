if (dead || other.dead) {
	exit;
}

var dt = 1 / 60;
var delta_x = other.x - x;
var delta_y = other.y - y;
var distance = sqrt(sqr(delta_x) + sqr(delta_y));
if (distance != 0) {
	var dir_x = delta_x / distance;
	var dir_y = delta_y / distance;

	vel_x -= dir_x * 50 * dt;
	vel_y -= dir_y * 50 * dt;
	/*
	var recoil_vel = 35;
	vel_x = -dir_x * recoil_vel;
	vel_y = -dir_y * recoil_vel;
	vel_dir += random_range(-20, 20);

	active = false;
	active_timer = active_timer_max;
	other.active = false;
	other.active_timer = active_timer_max;*/
}

if (active && other.model.team != model.team && ship_has_ability(model, Module.ThrusterModule, ThrusterAbility.EnemyBoost)) {
	collision_boost_timer = collision_boost_timer_max;
}
