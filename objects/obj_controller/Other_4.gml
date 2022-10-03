if (room == rm_tutorial) {
	obj_tutorial.image_index = tutorial_index;
	tutorial_index += 1;
}
if (room == rm_scavenge || room == rm_tutorial) {
	if (!audio_is_playing(snd_shop)) {
		audio_stop_all();
		audio_play_sound(snd_shop, 0, true, 1);
	}
}
if (room == rm_race) {
	audio_stop_all();
	var sounds = [ snd_race1, snd_race2, snd_race3 ];
	audio_play_sound(sounds[race_index % 3], 0, true);
	audio_sound_gain(sounds[race_index % 3], 1, 0);
}
