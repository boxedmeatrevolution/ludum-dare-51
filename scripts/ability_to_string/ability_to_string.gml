function ability_to_string(module, index) {
	switch (module.type) {
	case Module.LaserModule:
		switch (module.abilities[index]) {
			case LaserAbility.NoRecoil:
				return "No recoil";
			case LaserAbility.DoubleShot:
				return "Double shot";
			case LaserAbility.HomingShot:
				return "Homing shot";
			case LaserAbility.AllyBoost:
				return "Boost ally on hit";
		}
		break;
	case Module.ShieldModule:
		switch (module.abilities[index]) {
			case ShieldAbility.AsteroidPiercer:
				return "Pierce asteroids";
			case ShieldAbility.HpRegen:
				return "HP regen";
			case ShieldAbility.Reflect:
				return "Reflect lasers"
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