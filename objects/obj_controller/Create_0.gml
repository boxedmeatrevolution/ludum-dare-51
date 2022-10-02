num_teams = 3;

placement = [];

racers = array_create(num_teams, []);
for (var i = 1; i < num_teams; ++i) {
	racers[i] = array_create(3, noone);
	for (var j = 0; j < 3; ++j) {
		racers[i][j] = new Spaceship(i);
		racers[i][j].equip_standard();
	}
}
racers[0] = [ new Spaceship(0) ];
racers[0][0].equip_standard();

teams_in_race = [];
racers_in_race = [];
