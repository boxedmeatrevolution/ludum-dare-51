enum ShieldAbility {
	AsteroidPiercer,
	HpRegen,
	Reflect,
	AllyShield,
	NoStun,
	FuryOfTheFallen,
	Repulse
}

function Shield(_cost, _rating) constructor {
	type = Module.ShieldModule;
	cost = _cost;
	rating = _rating;
	abilities = [];
	static fill_random = function() {
		cost = choose(0, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5);
		rating = choose(1, 1, 1, 2, 2, 3);
		var num_abilities = choose(0, 1, 1, 1, 2);
		for (var i = 0; i < num_abilities; ++i) {
			next_ability = choose(
				ShieldAbility.AsteroidPiercer,
				ShieldAbility.HpRegen,
				ShieldAbility.Reflect,
				ShieldAbility.AllyShield,
				ShieldAbility.NoStun,
				ShieldAbility.FuryOfTheFallen,
				ShieldAbility.Repulse);
			array_push(abilities, next_ability);
		}
		if (num_abilities == 2) {
			if (abilities[0] == abilities[1]) {
				array_pop(abilities);
			}
		}
	}
}
