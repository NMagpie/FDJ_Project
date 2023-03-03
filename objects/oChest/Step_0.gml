if (distance_to_object(oPlayer) < 50){
	image_index = 1;
} else {
	image_index = 0;
}

cx = camera_get_view_x(view_camera[0]);
cy = camera_get_view_y(view_camera[0]);

text_x = cx + xDifference;
text_y = cy + yDifference;

if (chest_bought and payOnce) {
	instance_create_layer(x, y, "Items", objectInstance);
	global.money -= 2;
	payOnce = false;
}