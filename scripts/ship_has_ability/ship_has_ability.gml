function ship_has_ability(ship, module_type, ability) {
	var m;
	if (module_type == Module.LaserModule) {
		m = ship.laser;
	} else if (module_type == Module.ShieldModule) {
		m = ship.shield;
	} else if (module_type == Module.ThrusterModule) {
		m = ship.thruster;
	}
	for (var i = 0; i < array_length(m.abilities); ++i) {
		if (m.abilities[i] == ability) {
			return true;
		}
	}
	return false;
}
