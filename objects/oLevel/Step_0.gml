if (global.enemies < 10) 
{
	var platform = walls[irandom(array_length(walls) - 1)];
		
	if (instance_position(platform.x, platform.y, oWall) != noone) && (instance_position(platform.x, platform.y - tile_h, oWall) == noone)
	{
		instance_create_layer(platform.x, platform.y - tile_h, "Enemies", oEnemy);
		global.enemies++;
	}
}