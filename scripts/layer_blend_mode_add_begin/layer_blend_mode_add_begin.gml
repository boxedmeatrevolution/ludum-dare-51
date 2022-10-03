function layer_blend_mode_add_begin() {
	if (event_type == ev_draw && event_number == 0) {
		gpu_set_blendmode(bm_add);
	}
}