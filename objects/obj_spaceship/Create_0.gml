max_hp = 3;
max_thrust = 160;
hp = 3
vel_x = 0;
vel_y = 0;
dir = random_range(-25, 25);
vel_dir = 0;
active = true;
active_timer = 0;
active_timer_max = 1;
active_timer_no_stun_max = 0;
shoot_timer_max = 2;
shoot_timer = 1.5 * shoot_timer_max;
aim_dir = 0;
placement = -1;
placement_temp = 0;
image_speed = 0;

start_boost_timer = 0;
ally_boost = false;
ally_boost_timer = 0;
is_drafting = false;

max_regen_time = 7;
regen_timer = max_regen_time;

animation_timer = 0;
dead = false;

thrust_effect = instance_create_layer(x, y, "Lasers", obj_thrust);
thrust_effect.owner = self;

ally = noone;
