//var width = camera_get_view_width(view_camera[view_current]);
draw_sprite(spr_character, 0, x, y);
draw_sprite(spr_speech_bubble, 0, speech_x, speech_y);
if (state == STATE_SHOW_DIALOGUE) {
	draw_set_font(fnt_dialogue);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_black);
	draw_text_ext(speech_x, speech_y, active_dialogue, -1, 576);
	draw_set_color(c_white);
}
