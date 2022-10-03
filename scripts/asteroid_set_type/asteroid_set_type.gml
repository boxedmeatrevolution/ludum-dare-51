// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function asteroid_set_type(asteroid, type){
	asteroid.type = type;
	if (type == AsteroidType.Normal) {
		asteroid.hp = 1;
		asteroid.sprite_index = spr_asteroid;
	}
	else if (type == AsteroidType.Icy) {
		asteroid.hp = 1;
		asteroid.sprite_index = spr_asteroid_icy;
	}
	else if (type == AsteroidType.Metal) {
		asteroid.hp = 3;
		asteroid.sprite_index = spr_asteroid_metal;
	}
	else if (type == AsteroidType.Large) {
		asteroid.hp = 1;
		asteroid.sprite_index = spr_asteroid_large;
	}
	else if (type == AsteroidType.Rubber) {
		asteroid.hp = 2;
		asteroid.sprite_index = spr_asteroid_rubber;
	}
	else if (type == AsteroidType.Spicy) {
		asteroid.hp = 1;
		asteroid.sprite_index = spr_asteroid_spicy;
	}
	
	asteroid.image_index = irandom_range(0,image_number-1);
}
