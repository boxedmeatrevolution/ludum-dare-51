for (var i = 0; i < 15; ++i) {
	var delta = random(180);
	var theta = random(360);
	var dx = delta * dcos(theta);
	var dy = delta * dsin(theta);
	instance_create_layer(x+dx, y+dy, "Explosions", obj_explosion);
}
var hitbox = instance_create_layer(x, y, "Explosions", obj_explosion_hitbox);
hitbox.image_xscale = 180 / 32;
hitbox.image_yscale = 180 / 32;
hitbox.damage = 2;
