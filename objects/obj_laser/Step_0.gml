var dt = 1 / 60;
var vel = 500;

if (has_homing) {
	if (homing_target == noone || !instance_exists(homing_target) || homing_target.x < x) {
		var nearest_dist = infinity;
		with (obj_asteroid) {
			var delta_x = x - other.x;
			var delta_y = y - other.y;
			if (abs(delta_x) < nearest_dist && delta_x > 4 * abs(delta_y)) {
				nearest_dist = abs(delta_x);
				other.homing_target = self;
			}
		}
		with (obj_spaceship) {
			if (model.team != other.owner.model.team) {
				var delta_x = x - other.x;
				var delta_y = y - other.y;
				if (abs(delta_x) < nearest_dist && delta_x > 4 * abs(delta_y)) {
					nearest_dist = abs(delta_x);
					other.homing_target = self;
				}
			}
		}
	}
}
if (homing_target != noone && instance_exists(homing_target)) {
	var dir_to_target = darctan2(homing_target.y - y, homing_target.x - x);
	var delta_dir = mod_angle(dir_to_target - dir);
	dir += sign(delta_dir) * 41 * dt;
	dir = mod_angle(dir);
}
x += vel * dcos(dir) * dt;
y += vel * dsin(dir) * dt;
image_angle = -dir;
lifetime += dt;
if (lifetime > 1.1) {
	if (owner.model.team != -1 && ship_has_ability(owner.model, Module.LaserModule, LaserAbility.LongRange)) {
		lifetime = -100;
	} else {
		image_alpha = lerp(1.0, 0.0, (lifetime - 1.1) / 0.2);
	}
}
if (lifetime > 1.3) {
	instance_destroy(self);
}
