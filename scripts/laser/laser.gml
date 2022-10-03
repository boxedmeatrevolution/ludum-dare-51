enum LaserAbility {
	NoRecoil,
	DoubleShot,
	HomingShot,
	AllyBoost,
	LongRange,
	Fragment,
	Explode,
}

function Laser(_cost, _rating) constructor {
	type = Module.LaserModule;
	cost = _cost;
	rating = _rating;
	abilities = [];

	static fill_random = function() {
		cost = choose(0, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5);
		rating = choose(1, 1, 1, 2, 2, 3);
		var num_abilities = choose(0, 1, 1, 1, 2);
		for (var i = 0; i < num_abilities; ++i) {
			next_ability = choose(
				LaserAbility.NoRecoil,
				LaserAbility.DoubleShot,
				LaserAbility.HomingShot,
				LaserAbility.AllyBoost);
			array_push(abilities, next_ability);
		}
	}
}
