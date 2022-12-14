var dt = 1 / 60;

var thrust = max_thrust;
var drag = 0.8;
var shoot_impulse = 30;
var flywheel = 40;
var drag_dir = 0.4;

if (ship_has_ability(model, Module.ThrusterModule, ThrusterAbility.Agile)) {
	flywheel = 70;
}

if (is_drafting) {
	thrust += 40;
}
if (placement_temp > 2 && ship_has_ability(model, Module.ThrusterModule, ThrusterAbility.Catchup)) {
	thrust += 25;
}

animation_timer += dt;

if (ship_has_ability(model, Module.ShieldModule, ShieldAbility.Repulse)) {
	with (obj_asteroid) {
		var delta_x = other.x - x;
		var delta_y = other.y - y;
		var distance = sqrt(sqr(delta_x) + sqr(delta_y));
		if (distance < 200) {
			vel_x -= delta_x / distance * 12 * dt;
			vel_y -= delta_y / distance * 12 * dt;
		}
	}
}

if (!dead && obj_race_controller.race_started && ally != noone && !ally.dead) {
	var ally_has_share = ship_has_ability(ally.model, Module.ShieldModule, ShieldAbility.AllyShield);
	if (ally_has_share && hp <= 0 && ally.hp >= 2) {
		ally.hp -= 1;
		hp = 1;
	}
}

if (hp <= 0 && !dead) {
	vel_x = 0;
	vel_y = 0;
	dead = true;
	// Lose modules on death
	if (model.team == 0 && placement == -1) {
		ship_lost = true;
		ship_lost_modules = [
			obj_controller.racers_in_race[racer_index].thruster,
			obj_controller.racers_in_race[racer_index].shield,
			obj_controller.racers_in_race[racer_index].laser ];
		obj_controller.racers_in_race[racer_index].thruster = new Thruster(1, 1);
		obj_controller.racers_in_race[racer_index].shield = new Shield(1, 1);
		obj_controller.racers_in_race[racer_index].laser = new Laser(1, 1);
	}
	instance_create_layer(x, y, "Explosions", obj_explosion);
	visible = false;
	for (var i = 0; i < 10; ++i) {
		instance_create_layer(x, y, "Asteroids", obj_dust);
	}
}

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
	if (dead) {
		continue;
	}
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
		thrust = lerp(0, 0.5 * thrust, abs(mod_angle(dir_to - dir)) / 30);
	}
} else if (closest_target != noone) {
	var delta_x = closest_target.x - x;
	var delta_y = closest_target.y - y;
	dir_to = mod_angle(darctan2(delta_y, delta_x));
	aim_dir = dir_to;
} else {
	aim_dir = 0;
}

if (obj_race_controller.race_started && start_boost_timer < 1.8) {
	start_boost_timer += dt;
	if (ship_has_ability(model, Module.ThrusterModule, ThrusterAbility.StartBoost)) {
		thrust = max(thrust, 245);
	}
}
if (ally_boost) {
	ally_boost_timer -= dt;
	if (ally_boost_timer < 0) {
		ally_boost = false;
	}
	thrust = max(thrust, 245);
}

if (active && !dead && obj_race_controller.race_started && ship_has_ability(model, Module.ThrusterModule, ThrusterAbility.EnemyBoost)) {
	collision_boost_timer -= dt;
	if (collision_boost_timer >= 0) {
		thrust = max(thrust, 245);
	}
	else {
		collision_boost_timer = -1;
	}
}

if (active && !dead && obj_race_controller.race_started && ship_has_ability(model, Module.ShieldModule, ShieldAbility.FuryOfTheFallen)) {
	if (hp == 1) {
		thrust = max(thrust, 245);
	}
}


if (active && !dead && obj_race_controller.race_started && ship_has_ability(model, Module.ThrusterModule, ThrusterAbility.EndBoost)) {
	if (obj_race_controller.finish_line - x < 400) {
		thrust = max(thrust, 245);
	}
}

if (active && !dead && ship_has_ability(model, Module.ThrusterModule, ThrusterAbility.Draft)) {
	if (ally != noone && ally.active && !ally.dead) {
		var delta_x = ally.x - x;
		var delta_y = ally.y - y;
		if (abs(delta_x) > abs(delta_y) && abs(delta_x) < 350) {
			if (delta_x > 0) {
				is_drafting = true;
				ally.is_drafting = false;
			} else {
				is_drafting = false;
				ally.is_drafting = true;
			}
		} else {
			is_drafting = false;
			ally.is_drafting = false;
		}
	}
}

if (active && !dead && thrust / max_thrust > 0.7 && ship_has_ability(model, Module.ThrusterModule, ThrusterAbility.Push)) {
	with (obj_spaceship) {
		if (!dead && model.team != other.model.team) {
			var delta_x = other.x - x;
			var delta_y = other.y - y;
			var distance = sqrt(sqr(delta_x) + sqr(delta_y));
			if (abs(delta_x) > abs(delta_y) && delta_x > 0 && distance < 250) {
				vel_x -= delta_x / distance * 200 * dt;
				vel_y -= delta_y / distance * 200 * dt;
			}
		}
	}
}

var accel_x = 0;
var accel_y = 0;
var torque = 0;

accel_x -= drag * vel_x;
accel_y -= drag * vel_y;
torque -= drag_dir * vel_dir;
if (active && !dead && obj_race_controller.race_started) {
	var dir_x = dcos(dir);
	var dir_y = dsin(dir);
	accel_x += dir_x * thrust;
	accel_y += dir_y * thrust;
	thrust_effect.thrust_level = thrust / max_thrust;
	
	shoot_timer -= dt;
	if (shoot_timer < 0) {
		var num_shots = 1;
		if (ship_has_ability(model, Module.LaserModule, LaserAbility.DoubleShot)) {
			num_shots *= 2;
		}
		shoot_timer = shoot_timer_max;
		for (var i = 0; i < num_shots; ++i) {
			var offset = (i + 0.5 - 0.5 * num_shots) * 32;
			if (ship_has_ability(model, Module.LaserModule, LaserAbility.NoRecoil)) {
			} else {
				vel_x -= shoot_impulse * dir_x;
				vel_y -= shoot_impulse * dir_y;
			}
			var laser = instance_create_layer(x + offset * dsin(dir), y - offset * dcos(dir), "Lasers", obj_laser);
			laser.dir = dir;
			laser.owner = self;
			if (ship_has_ability(model, Module.LaserModule, LaserAbility.HomingShot)) {
				laser.has_homing = true;
			}
		}
	}

	torque += flywheel * sign(mod_angle(aim_dir - dir));
	
	if (ship_has_ability(model, Module.ShieldModule, ShieldAbility.HpRegen) && hp < max_hp) {
		regen_timer -= dt;
		if (regen_timer < 0) {
			regen_timer = max_regen_time;
			hp += 1;
		}
	}
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
