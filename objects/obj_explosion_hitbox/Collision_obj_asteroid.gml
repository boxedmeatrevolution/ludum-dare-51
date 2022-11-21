for (var i = 0; i < array_length(hit); ++i) {
	if (hit[i] == other) {
		exit;
	}
}
array_push(hit, other);

other.hp -= damage;
