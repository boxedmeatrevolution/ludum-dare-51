draw_set_font(fnt_money);
draw_sprite(spr_coin, 0, x, y);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text(x + 40, y, string(obj_controller.money));
