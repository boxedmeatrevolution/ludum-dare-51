if (room == rm_race || (room == rm_tutorial && race_index == 0)) {
	// Give new ship.
	if (race_index == 2) {
		array_push(racers[0], new Spaceship(0));
		racers[0][1].player_index = 1;
		racers[0][1].equip_standard(2);
	}
	if (race_index == 4) {
		array_push(racers[0], new Spaceship(0));
		racers[0][2].player_index = 2;
		racers[0][2].equip_standard(1);
	}
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
	money += 5;
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
	
	// environment
	if (race_index == 0) {
		race_length = 1;
		environment = [ AsteroidType.Normal ];
	} else if (race_index == 1) {
		race_length = 2;
		environment = [ AsteroidType.Normal ];
	} else if (race_index == 2) {
		race_length = 2;
		environment = [ AsteroidType.Normal, AsteroidType.Large ];
	} else if (race_index == 3) {
		race_length = 3;
		environment = [ AsteroidType.Normal, AsteroidType.Metal ];
	} else if (race_index == 4) {
		race_length = 1;
		environment = [ AsteroidType.Normal, AsteroidType.Icy ];
	} else if (race_index <= 6) {
		race_length = choose(1, 2, 2, 3);
		var env_count = choose(2, 3);
		environment = [];
		array_push(environment, AsteroidType.Normal);
		for (var i = 0; i < env_count - 1; ++i) {
			var next = choose(AsteroidType.Icy, AsteroidType.Rubber, AsteroidType.Spicy);
			array_push(environment, next);
		}
	} else {
		race_length = choose(1, 2, 2, 3);
		var env_count = choose(1, 2, 2, 3);
		environment = [];
		for (var i = 0; i < env_count; ++i) {
			var next = choose(AsteroidType.Normal, AsteroidType.Normal, AsteroidType.Large, AsteroidType.Spicy, AsteroidType.Icy, AsteroidType.Rubber, AsteroidType.Metal);
			array_push(environment, next);
		}
	}
	array_sort(environment, true);

	// Prepare scavenging.
	scavenge_slots = [ noone, noone, noone ];
	scavenge_active = [ true, true, true ];
	
	if (race_index != 0) {
		for (var i = 0; i < 8; ++i) {
			var upgrade_team = irandom_range(1, num_teams - 1);
			var upgrade_pilot = irandom_range(0, array_length(racers[upgrade_team]) - 1);
			if (random(1) < 0.333333) {
				racers[upgrade_team][upgrade_pilot].thruster.fill_random();
			} else if (random(1) < 0.5) {
				racers[upgrade_team][upgrade_pilot].shield.fill_random();
			} else {
				racers[upgrade_team][upgrade_pilot].laser.fill_random();
			}
		}
	}
	
	race_index += 1;
} else if (room == rm_scavenge) {
	// Lock in player modifications.
	placement = [];
}
