image_speed = 0;

collidePlayer = false;

xDifference = x - camera_get_view_x(view_camera[0])
yDifference = y - camera_get_view_y(view_camera[0])

objectSprite = 0;
payOnce = true;

text_x = x;
text_y = y;

chest_cost = random_range(15, 25);
chest_cost = floor(chest_cost);

draw_set_font(fChest);

chest_bought = false;

if (chest_bought){
	image_index = 1;
}