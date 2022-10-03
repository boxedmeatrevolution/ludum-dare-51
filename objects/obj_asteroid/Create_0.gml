enum AsteroidType {
	Large,
	Normal,
	Metal,
	Icy,
	Spicy,
	Rubber,
};

hp = 1;

model = { team: -1 };
type = AsteroidType.Normal;

vel_x = 0;
vel_y = 0;
vel_dir = random_range(-40, 40);
image_angle = random(360);

image_speed = 0;
image_index = irandom_range(0, image_number - 1);