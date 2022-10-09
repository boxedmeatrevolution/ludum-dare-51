var dt = 1 / 60;
var x1 = -500;
var x2 = 200;
var speech_y1 = -500;
var speech_y2 = 200;
var lambda = 0.5 * (1 - cos(pi * timer / time_to_enter));
if (state == STATE_ENTER) {
	timer += dt;
	x = lerp(x1, x2, lambda);
	speech_y = lerp(speech_y1, speech_y2, lambda);
	if (timer > time_to_enter) {
		state = STATE_SHOW_DIALOGUE;
		timer = 0;
		dialogue_idx = 0;
		dialogue_char_idx = 0;
		active_dialogue = "";
	}
} else if (state == STATE_EXIT) {
	timer += dt;
	x = lerp(x2, x1, 0.5 * (1 - cos(pi * timer / time_to_enter)));
	speech_y = lerp(speech_y2, speech_y1, lambda);
	if (timer > time_to_enter) {
		instance_destroy(self);
	}
} else if (state == STATE_SHOW_DIALOGUE) {
	if (dialogue_char_idx < string_length(dialogue[dialogue_idx])) {
		active_dialogue += string_char_at(dialogue[dialogue_idx], dialogue_char_idx + 1);
		dialogue_char_idx += 1;
		if (dialogue_char_idx == string_length(dialogue[dialogue_idx])) {
			complete = true;
			clickable = false;
			timer = 0;
		}
	}
	if (!clickable) {
		timer += dt;
		if (timer > 0.2) {
			clickable = true;
		}
	}
}
