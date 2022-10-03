other.hp -= 1;

if (other.type == AsteroidType.Icy) {
	var laser = instance_create_layer(x, y, "Lasers", obj_laser);
	laser.dir = random_range(90, 270);
	laser.owner = other;
}

instance_destroy(self);