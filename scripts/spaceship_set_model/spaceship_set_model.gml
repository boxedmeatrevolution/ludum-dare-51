function spaceship_set_model(ship, _model) {
	ship.model = _model;
	if (_model.shield.rating == 1) {
		ship.max_hp = 4;
	} else if (_model.shield.rating == 2) {
		ship.max_hp = 6;
	} else if (_model.shield.rating == 3) {
		ship.max_hp = 8;
	}
	ship.hp = ship.max_hp;
}