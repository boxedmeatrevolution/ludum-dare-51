max_hp = 3;
hp = 3
vel_x = 0;
vel_y = 0;
dir = random_range(-25, 25);
vel_dir = 0;
active = true;
active_timer = 0;
active_timer_max = 1;
shoot_timer_max = 2;
shoot_timer = 1.5 * shoot_timer_max;
aim_dir = 0;
placement = -1;
image_speed = 0;

animation_timer = 0;
dead = false;

thrust_effect = instance_create_layer(x, y, "Lasers", obj_thrust);
thrust_effect.owner = self;