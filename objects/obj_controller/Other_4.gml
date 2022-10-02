if (room == rm_scavenge) {
	// Choose two teams to race against.
	var team_1 = irandom_range(1, num_teams - 1);
	var team_2 = team_1;
	while (team_2 == team_1) {
		team_2 = irandom_range(1, num_teams - 1);
	}
	teams_in_race = [ 0, team_1, team_2 ];
	racers_in_race = [];
	// Player always gets two slots.
	var player_entrants = min(2, array_length(racers[0]));
	for (var i = 0; i < player_entrants; ++i) {
		array_push(racers_in_race, racers[0][i]);
	}
	// Each other chosen team gets two slots.
	for (var i = 1; i <= 2; ++i) {
		var racer_1 = irandom_range(0, array_length(racers[teams_in_race[i]]) - 1);
		var racer_2 = racer_1;
		while (racer_2 == racer_1) {
			racer_2 = irandom_range(0, array_length(racers[teams_in_race[i]]) - 1);
		}
		array_push(racers_in_race, racers[teams_in_race[i]][racer_1]);
		array_push(racers_in_race, racers[teams_in_race[i]][racer_2]);
	}
} else if (room == rm_race) {
	// Lock in player modifications.
}
