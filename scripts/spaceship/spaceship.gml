enum Module {
	ShieldModule,
	LaserModule,
	ThrusterModule,
}

function Spaceship(_team) constructor {
	team = _team;
	player_index = -1;
	pilot = noone;
	thruster = noone;
	shield = noone;
	laser = noone;
	
	static equip_standard = function(quality) {
		pilot = noone;
		thruster = new Thruster(2, quality);
		shield = new Shield(2, quality);
		laser = new Laser(2, quality);
	}
}