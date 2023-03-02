 //Update Destination

if (instance_exists(follow)){
	if (follow.x > 0) && (follow.x < room_width)
		xTo = follow.x;
	if (follow.y > 0) && (follow.y < room_height)
		yTo = follow.y;
}

// Update object position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

camera_set_view_pos(cam, x - view_w / 2, y - view_h / 2);

layer_move_y = room_height - oPlayer.y;

layer_x("SkyLayer", x);
layer_y("SkyLayer", y - view_h / 2);

layer_x("SunLayer", x);
layer_y("SunLayer", y - view_h / 2 + 128);

layer_x("CloudsLayer", x * .75);
layer_y("CloudsLayer", y - view_h / 2 + 128);

layer_x("GroundLayer3", x * .5);
layer_y("GroundLayer3", (y - view_h / 2 + 128) * .1);

layer_x("GroundLayer2", x * .25);
layer_y("GroundLayer2", (y - view_h / 2 + 128) * .01);

layer_x("GroundLayer1", x * .1);
layer_y("GroundLayer1", (y - view_h / 2 + 128) * .005);