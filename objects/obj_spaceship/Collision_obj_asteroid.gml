if (dead) {
	exit;
}

var delta_x = other.x - x;
var delta_y = other.y - y;
var distance = sqrt(sqr(delta_x) + sqr(delta_y));
var dir_x = delta_x / distance;
var dir_y = delta_y / distance;

var recoil_vel = 25;

if (other.type == AsteroidType.Rubber) {
	recoil_vel = 300;
}

vel_x = -dir_x * recoil_vel;
vel_y = -dir_y * recoil_vel;
vel_dir += random_range(-20, 20);

hp -= 1;
active = false;
active_timer = active_timer_max;
var shield = instance_create_layer(x, y, "Shields", obj_shield);
shield.owner = self;


other.hp = 0;
instance_destroy(other);
