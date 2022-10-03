if (room == rm_race || room == rm_init) {
	// Give money.
	for (var i = 0; i < array_length(placement); ++i) {
		if (placement[i].player_index != -1) {
			if (i == 0) {
				money += 20;
			} else if (i == 1) {
				money += 10;
			} else if (i == 2) {
				money += 5;
			}
		}
	}
	// Choose two teams to race against.
	var team_1 = irandom_range(1, num_teams - 1);
	var team_2 = team_1;
	while (team_2 == team_1) {
		team_2 = irandom_range(1, num_teams - 1);
	}
	teams_in_race = [ 0, team_1, team_2 ];
	var old_players_in_race = [];
	for (var i = 0; i < array_length(racers_in_race); ++i) {
		if (racers_in_race[i].player_index != -1) {
			array_push(old_players_in_race, racers_in_race[i]);
		} else {
			break;
		}
	}
	racers_in_race = [];
	// Player always gets two slots.
	var player_entrants = min(2, array_length(racers[0]));
	if (array_length(old_players_in_race) == player_entrants) {
		for (var i = 0; i < array_length(old_players_in_race); ++i) {
			array_push(racers_in_race, old_players_in_race[i]);
		}
	} else {
		for (var i = 0; i < player_entrants; ++i) {
			array_push(racers_in_race, racers[0][i]);
		}
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
	
	// race type
	race_length = choose(1, 2, 2, 3);
	
	// Prepare scavenging.
	scavenge_slots = [ noone, noone, noone ];
	scavenge_active = [ true, true, true ];
} else if (room == rm_scavenge) {
	// Lock in player modifications.
	placement = [];
}
