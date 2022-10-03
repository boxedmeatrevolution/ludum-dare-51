var explode = instance_create_layer(x, y, "Lasers", obj_laser_explode);
explode.image_angle = image_angle;
explode.image_alpha = image_alpha;
if (owner.model.team != -1 && ship_has_ability(owner.model, Module.LaserModule, LaserAbility.Fragment)) {
	for (var i = 0; i < 2; ++i) {
		var laser = instance_create_layer(other.x, other.y, "Lasers", obj_laser);
		laser.dir = random_range(-90, 90);
		laser.owner = { model: { team: -1 } };
	}
}
if (owner.model.team != -1 && ship_has_ability(owner.model, Module.LaserModule, LaserAbility.Explode)) {
	for (var i = 0; i < 15; ++i) {
		var delta = random(120);
		var theta = random(360);
		var dx = delta * dcos(theta);
		var dy = delta * dsin(theta);
		instance_create_layer(x+dx, y+dy, "Explosions", obj_explosion);
	}
	with (obj_asteroid) {
		var distance = sqr(x - other.x) + sqr(y - other.y);
		if (distance < sqr(120) && hp > 0) {
			hp -= 1;
		}
	}
	with (obj_spaceship) {
		var distance = sqr(x - other.x) + sqr(y - other.y);
		if (distance < sqr(120) && hp > 0) {
			hp -= 1;
		}
	}
}
