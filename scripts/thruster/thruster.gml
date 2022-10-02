enum ThrusterAbility {
	StartBoost,
	LastPlaceBoost,
	FirstPlaceBoost,
}

function Thruster(_cost, _rating) constructor {
	type = Module.ThrusterModule;
	cost = _cost;
	rating = _rating;
	abilities = [];
	
	static fill_random = function() {
		cost = choose(1, 2, 3, 4);
		rating = choose(1, 1, 1, 2, 2, 3);
		var num_abilities = choose(0, 1, 1, 1, 2);
		cost += num_abilities;
		cost += rating - 1;
		for (var i = 0; i < num_abilities; ++i) {
			next_ability = choose(
				ThrusterAbility.StartBoost,
				ThrusterAbility.LastPlaceBoost,
				ThrusterAbility.FirstPlaceBoost);
			array_push(abilities, next_ability);
		}
	}
}
