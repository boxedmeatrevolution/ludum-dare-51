function ability_to_string(module, index) {
	switch (module.type) {
	case Module.LaserModule:
		switch (module.abilities[index]) {
			case LaserAbility.NoRecoil:
				return "No recoil";
		}
		break;
	case Module.ShieldModule:
		switch (module.abilities[index]) {
			case ShieldAbility.AsteroidPiercer:
				return "Pierce asteroids";
		}
		break;
	case Module.ThrusterModule:
		switch (module.abilities[index]) {
			case ThrusterAbility.StartBoost:
				return "Boost at race start";
		}
		break;
	}
}