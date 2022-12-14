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
			case LaserAbility.LongRange:
				return "Infinite range";
			case LaserAbility.Fragment:
				return "Fragment shot";
			case LaserAbility.Explode:
				return "Exploding shot";
		}
		break;
	case Module.ShieldModule:
		switch (module.abilities[index]) {
			case ShieldAbility.AsteroidPiercer:
				return "Pierce asteroids";
			case ShieldAbility.HpRegen:
				return "Shield regen";
			case ShieldAbility.Reflect:
				return "Reflect lasers";
			case ShieldAbility.AllyShield:
				return "Share with ally";
			case ShieldAbility.NoStun:
				return "No laser hit stun";
			case ShieldAbility.FuryOfTheFallen:
				return "Boost near death";
			case ShieldAbility.Repulse:
				return "Repulse asteroids";
		}
		break;
	case Module.ThrusterModule:
		switch (module.abilities[index]) {
			case ThrusterAbility.StartBoost:
				return "Boost at race start";
			case ThrusterAbility.Draft:
				return "Draft with allies";
			case ThrusterAbility.Catchup:
				return "Faster while losing";
			case ThrusterAbility.Agile:
				return "Sharper turns";
			case ThrusterAbility.EndBoost:
				return "Boost near finish line";
			case ThrusterAbility.Push:
				return "Push enemies away";
			case ThrusterAbility.EnemyBoost:
				return "Boost near enemies";
		}
		break;
	}
}
