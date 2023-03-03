depth = -9999;

xDifference = x - camera_get_view_x(view_camera[0])
yDifference = y - camera_get_view_y(view_camera[0])

// item constructor
function create_item(_name, _desc, _spr, _obj, _id) constructor {
	name = _name;
	description = _desc;
	sprite = _spr;
	object = _obj;
	item_id = _id;
}
 

//create items
global.item_list = ds_map_create();

ds_map_add(global.item_list, 
"Medkit",  new create_item( 
		"Medkit",
		"Increase HP/s",
		sMedkit,
		oMedkit,
		0,
	),
);

ds_map_add(global.item_list, 
"Crowbar", new create_item(
		"Crowbar",
		"Increase Damage",
		sCrowbar,
		oCrowbar,
		1,
	)
);

global.all_items = ds_map_size(global.item_list);

// create inventory
inv = array_create(0);

selected_item = -1;

// for drawing and mouse pos
sep = 16;
screen_bord = 16;


