if (state == STATE_SHOW_DIALOGUE) {
	if (!complete) {
		active_dialogue = dialogue[dialogue_idx];
		dialogue_char_idx = string_length(active_dialogue);
		complete = true;
		clickable = true;
	} else if (!clickable) {
		clickable = true;
	} else if (clickable) {
		active_dialogue = "";
		dialogue_idx += 1;
		dialogue_char_idx = 0;
		complete = false;
		clickable = false;
		if (dialogue_idx >= array_length(dialogue)) {
			state = STATE_EXIT;
			timer = 0;
		}
	}
}
