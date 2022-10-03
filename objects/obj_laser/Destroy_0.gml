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
