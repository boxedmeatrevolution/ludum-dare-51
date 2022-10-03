var dt = 1 / 60;
x = owner.x - 48 * dcos(owner.image_angle);
y = owner.y + 48 * dsin(owner.image_angle);
image_angle = owner.image_angle;

visual_thrust_level = (visual_thrust_level - thrust_level) * exp(-dt / 0.2) + thrust_level;
image_alpha = lerp(0.0, 1.0, visual_thrust_level);

ring_timer -= visual_thrust_level * dt;
if (ring_timer < 0) {
	ring_timer = ring_timer_max;
	var ring = instance_create_layer(x, y, "Lasers", obj_thrust_ring);
	ring.image_angle = image_angle;
	ring.image_blend = image_blend;
}
