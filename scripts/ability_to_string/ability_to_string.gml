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
			case ThrusterAbility.FirstPlaceBoost:
				return "Turbo when in first";
			case ThrusterAbility.LastPlaceBoost:
				return "Turbo when in last";
			case ThrusterAbility.StartBoost:
				return "Launch at race start";
		}
		break;
	}
}