obj_button_controller.mouse_is_over = self;
if (obj_button_controller.active_button == noone) {
	is_hovered = true;
} 
else if (obj_button_controller.active_button == self) {
	is_hovered = true;	
	is_pressed = true;
}
