depth = -9999;

xDifference = x - camera_get_view_x(view_camera[0])
yDifference = y - camera_get_view_y(view_camera[0])

// item constructor
function create_item(_name, _desc, _spr, _id) constructor {
	name = _name;
	description = _desc;
	sprite = _spr;
	item_id = _id;
}
 

//create items
global.item_list = 
{
	medkit : new create_item( 
		"Medkit",
		"Increase HP/s",
		sMedkit,
		0,
	),
	crowbar : new create_item(
		"Crow Bar",
		"Increase Damage",
		sCrowbar,
		1,
	),
}

global.all_items = 2;

// create inventory
inv = array_create(0);

selected_item = -1;

// for drawing and mouse pos
sep = 16;
screen_bord = 16;


