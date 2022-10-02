enum ThrusterAbility {
	StartBoost,
	LastPlaceBoost,
	FirstPlaceBoost,
}

function Thruster(_cost, _rating) constructor {
	cost = _cost;
	rating = _rating;
	abilities = [];
}
