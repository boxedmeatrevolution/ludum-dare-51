var dt = 1 / 60;
x = owner.x - 48 * dcos(owner.image_angle);
y = owner.y + 48 * dsin(owner.image_angle);
image_angle = owner.image_angle;

visual_thrust_level = (visual_thrust_level - thrust_level) * exp(-dt / 0.2) + thrust_level;
image_alpha = lerp(0.0, 1.0, visual_thrust_level);

if (visual_thrust_level < 1) {
	image_blend = make_color_hsv(212.5, 255, 255);
} else {
	image_blend = make_color_hsv(lerp(212.5, 255, clamp((visual_thrust_level - 1) / 0.5, 0, 1)), 255, 255);
}

ring_timer -= visual_thrust_level * dt;
if (ring_timer < 0) {
	ring_timer = ring_timer_max;
	var ring = instance_create_layer(x, y, "Lasers", obj_thrust_ring);
	ring.image_angle = image_angle;
	ring.image_blend = image_blend;
}
