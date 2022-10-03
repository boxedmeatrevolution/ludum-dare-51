var module = noone;
var model = obj_controller.racers[0][obj_scavenge_spaceship_large.index];
switch (type) {
case "Thruster":
	module = model.thruster;
	break;
case "Shield":
	module = model.shield;
	break;
case "Laser":
	module = model.laser;
	break;
}
draw_module_card(x, y, module, image_index);
