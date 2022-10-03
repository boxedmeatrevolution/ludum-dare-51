var dt = 1 / 60;

var max_thrust = 160;
var thrust = max_thrust;
var drag = 0.8;
var shoot_impulse = 30;
var flywheel = 40;
var drag_dir = 0.4;

// If any asteroids close, steer away.
closest_dangerous = noone;
var closest_dangerous_distance = infinity;
with (obj_asteroid) {
	var delta_x = x - other.x;
	var delta_y = y - other.y;
	var distance = sqrt(sqr(delta_x) + sqr(delta_y));
	var is_dangerous = (distance < 300) && (delta_x > 0) && (abs(delta_x) > abs(delta_y));
	if (distance < closest_dangerous_distance && is_dangerous) {
		other.closest_dangerous = self;
		closest_dangerous_distance = distance;
	}
}
/*
with (obj_spaceship) {
	var delta_x = x - other.x;
	var delta_y = y - other.y;
	var distance = sqrt(sqr(delta_x) + sqr(delta_y));
	var is_dangerous = (distance < 300) && (delta_x > 0) && (abs(delta_x) > abs(delta_y));
	if (distance < closest_dangerous_distance && is_dangerous) {
		other.closest_dangerous = self;
		closest_dangerous_distance = distance;
	}
}*/

closest_target = noone;
var closest_target_distance = infinity;
with (obj_asteroid) {
	var delta_x = x - other.x;
	var delta_y = y - other.y;
	var distance = sqrt(sqr(delta_x) + sqr(delta_y));
	var is_target = (distance > 300) &&  (distance < 600) && (delta_x > 0) && (abs(delta_x) > 10 * abs(delta_y));
	if (distance < closest_target_distance && is_target) {
		other.closest_target = self;
		closest_target_distance = distance;
	}
}
with (obj_spaceship) {
	var delta_x = x - other.x;
	var delta_y = y - other.y;
	var distance = sqrt(sqr(delta_x) + sqr(delta_y));
	var is_target = (model.team != other.model.team) && (distance > 300) && (distance < 600) && (delta_x > 0) && (abs(delta_x) > 10 * abs(delta_y));
	if (distance < closest_target_distance && is_target) {
		other.closest_target = self;
		closest_target_distance = distance;
	}
}

if (closest_dangerous != noone) {
	var delta_x = closest_dangerous.x - x;
	var delta_y = closest_dangerous.y - y;
	var dir_to = mod_angle(darctan2(delta_y, delta_x));
	if (delta_y > 0) {
		aim_dir = min(mod_angle(dir_to - 40), 0);
	} else {
		aim_dir = max(mod_angle(dir_to + 40), 0);
	}
	if (abs(mod_angle(dir_to - dir)) < 30) {
		thrust = lerp(0, 0.5 * max_thrust, abs(mod_angle(dir_to - dir)) / 30);
	}
} else if (closest_target != noone) {
	var delta_x = closest_target.x - x;
	var delta_y = closest_target.y - y;
	dir_to = mod_angle(darctan2(delta_y, delta_x));
	aim_dir = dir_to;
} else {
	aim_dir = 0;
}

var accel_x = 0;
var accel_y = 0;
var torque = 0;

accel_x -= drag * vel_x;
accel_y -= drag * vel_y;
torque -= drag_dir * vel_dir;
if (active && obj_race_controller.race_started) {
	var dir_x = dcos(dir);
	var dir_y = dsin(dir);
	accel_x += dir_x * thrust;
	accel_y += dir_y * thrust;
	thrust_effect.thrust_level = thrust / max_thrust;
	
	shoot_timer -= dt;
	if (shoot_timer < 0) {
		shoot_timer = shoot_timer_max;
		vel_x -= shoot_impulse * dir_x;
		vel_y -= shoot_impulse * dir_y;
		var laser = instance_create_layer(x, y, "Lasers", obj_laser);
		laser.dir = dir;
		laser.owner = self;
	}

	torque += flywheel * sign(mod_angle(aim_dir - dir));
} else {
	thrust_effect.thrust_level = 0.0;
	shoot_timer = 1.5 * shoot_timer_max;
}

vel_x += accel_x * dt;
vel_y += accel_y * dt;
vel_dir += torque * dt;

x += vel_x * dt;
y += vel_y * dt;
dir += vel_dir * dt;
dir = mod_angle(dir);
image_angle = -dir;

if (y < 0) {
	vel_y = abs(vel_y);
	//dir = abs(dir);
}
if (y > room_height) {
	vel_y = -abs(vel_y);
	//dir = -abs(dir);
}

if (!active) {
	active_timer -= dt;
	if (active_timer < 0) {
		active = true;
	}
}
