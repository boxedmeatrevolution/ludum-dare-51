if (other.dead || lifetime < 0.3) {
	exit;
}

if (other.model.team == owner.model.team && other != owner) {
	if (ship_has_ability(owner.model, Module.LaserModule, LaserAbility.AllyBoost)) {
		other.ally_boost = true;
		other.ally_boost_timer = 2;
		instance_destroy(self);
	}
}

if (other.model.team != owner.model.team) {
	var delta_x = x - other.x;
	var delta_y = y - other.y;
	var distance = sqrt(sqr(delta_x) + sqr(delta_y));
	other.vel_x = 30 * delta_x / distance;
	other.vel_y = 30 * delta_y / distance;
	other.vel_dir += random_range(-20, 20);

	other.hp -= 1;
	other.active = false;
	other.active_timer = other.active_timer_max;
	var shield = instance_create_layer(other.x, other.y, "Shields", obj_shield);
	shield.owner = other;

	instance_destroy(self);
}
