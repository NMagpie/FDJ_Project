cx = camera_get_view_x(view_camera[0]);
cy = camera_get_view_y(view_camera[0]);

x = cx + xDifference;
y = cy + yDifference;

selected_item = -1;
for (var i = 0; i < array_length(inv); i++){
	var _xx = x + sep * i;
	var _yy = y+700;
	
	if (mouse_x > _xx and mouse_x < _xx + 8) and (mouse_y > _yy and mouse_y < _yy + 8)  {
		selected_item = i;
	}
}