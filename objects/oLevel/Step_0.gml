if (global.enemies < 10) 
{
	var platform = walls[irandom(array_length(walls) - 1)];
		
	if (instance_position(platform.x, platform.y, oWall) != noone) && (instance_position(platform.x, platform.y - tile_h, oWall) == noone)
	{
		instance_create_layer(platform.x, platform.y - tile_h, "Enemies", oEnemy);
		global.enemies++;
	}
}

if (keyboard_check_pressed(vk_f5))
{
	instance_destroy(global.level.id);

	global.level = instance_create_layer(0, 0, "Level_Base", oLevel);
}