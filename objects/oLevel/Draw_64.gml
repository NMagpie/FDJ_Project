if (instance_exists(global.player)) {
draw_set_halign(fa_right);
var _str = string(global.money);
draw_set_color(c_yellow);
draw_text_transformed(x + 1000, y + 30, "Money: ", 1, 1, 0);
draw_set_color(c_white);
draw_text_transformed(x + 1100, y + 30, _str, 1, 1, 0);

draw_set_halign(fa_left);
_str = string(oPlayer.hp);
draw_set_color(c_red);
draw_text_transformed(x + 100, y + 60, "HP: ", 1, 1, 0);
draw_set_color(c_white);
draw_text_transformed(x + 300, y + 60, _str, 1, 1, 0);

draw_set_halign(fa_left);
_str = string(oPlayer._score);
draw_set_color(c_red);
draw_text_transformed(x + 100, y + 30, "Score: ", 1, 1, 0);
draw_set_color(c_white);
draw_text_transformed(x + 300, y + 30, _str, 1, 1, 0);

}
else
{
	draw_set_halign(fa_center);

	draw_set_color(c_yellow);
	draw_text_transformed(x + 1366 * .5, y + 768 * .5 - 100, "Game Over! ", 1, 1, 0);

	var _str = "Your Score: " + string(global._score);
	draw_set_color(c_white);
	draw_text_transformed(x + 1366 * .5, y + 768 * .5, _str, 1, 1, 0);

	_str = "Press F5 to restart game..."
	draw_set_color(c_white);
	draw_text_transformed(x + 1366 * .5, y + 768 * .5 + 100, _str, 1, 1, 0);
}