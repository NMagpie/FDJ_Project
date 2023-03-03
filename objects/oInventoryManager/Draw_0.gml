for (var i = 0; i < array_length(inv); i++) {
	var _xx = x;
	var _yy = y+700;
	var _sep = 60;
	var _col = c_white;
	
	draw_sprite(inv[i].sprite, 0, _xx + _sep * i, _yy);
	if (selected_item == i) {
		_col = c_yellow;
	}
	if (selected_item == i) {
		draw_text_ext(_xx + _sep * array_length(inv), _yy + 16, inv[i].description, 12, 80)
	}
	
	draw_set_color(c_white);
}