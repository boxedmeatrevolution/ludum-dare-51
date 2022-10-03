enum ShieldAbility {
	AsteroidPiercer,
	HpRegen,
	Reflect,
	AllyShield
}

function Shield(_cost, _rating) constructor {
	type = Module.ShieldModule;
	cost = _cost;
	rating = _rating;
	abilities = [ ShieldAbility.AllyShield ];

	static fill_random = function() {
		cost = choose(0, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5);
		rating = choose(1, 1, 1, 2, 2, 3);
		var num_abilities = choose(0, 1, 1, 1, 2);
		for (var i = 0; i < num_abilities; ++i) {
			next_ability = choose(
				ShieldAbility.AsteroidPiercer);
			array_push(abilities, next_ability);
		}
	}
}
