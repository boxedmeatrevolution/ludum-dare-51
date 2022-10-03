function spaceship_set_model(ship, _model) {
	ship.model = _model;
	if (_model.shield.rating == 1) {
		ship.max_hp = 4;
	} else if (_model.shield.rating == 2) {
		ship.max_hp = 6;
	} else if (_model.shield.rating == 3) {
		ship.max_hp = 8;
	}
	if (_model.laser.rating == 1) {
		ship.shoot_timer_max = 2.75;
	} else if (_model.laser.rating == 2) {
		ship.shoot_timer_max = 2;
	} else if (_model.laser.rating == 3) {
		ship.shoot_timer_max = 1.25;
	}
	if (_model.thruster.rating == 1) {
		ship.max_thrust = 120;
	} else if (_model.thruster.rating == 2) {
		ship.max_thrust = 160;
	} else if (_model.thruster.rating == 3) {
		ship.max_thrust = 190;
	}
	ship.hp = ship.max_hp;
}