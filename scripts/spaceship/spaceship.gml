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
	
	static equip_standard = function() {
		pilot = noone;
		thruster = new Thruster(2, 2);
		shield = new Shield(2, 2);
		laser = new Laser(2, 2);
	}
}