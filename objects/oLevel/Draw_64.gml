draw_set_halign(fa_right);
var _str = string(global.money);
draw_set_color(c_yellow);
draw_text_transformed(x + 1000, y + 30, "Money: ", 1, 1, 0);
draw_set_color(c_white);
draw_text_transformed(x + 1100, y + 30, _str, 1, 1, 0);
