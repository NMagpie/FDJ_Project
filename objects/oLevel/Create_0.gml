randomize();

custom_randomize();

global.level = self;
global.enemies = 0;
global.money = 0;
global.chests = irandom(5);

level_w = room_width;

level_h = room_height;

tile_h = 64;

rooms = [];

walls = [];

flora = [];

ropes = [];

enemies = [];

#macro enemy_spawn_delay 5 * 60;

alarm[0] = enemy_spawn_delay;

n_col = level_w / 512;//8;

n_row = level_h / 384;//4;

room_w = level_w / n_col;

room_h = level_h / n_row;

function put_platform( _x, _y, length) {
	
	for (var i = 0; i + tile_h <= length; i += tile_h) {
			var inst = instance_create_layer(_x + i, _y, "Level_Base", oWall);
	
			array_push(walls, inst);
	}
}

function put_ladder( _x, _y, length ) {
	
	if (length < 4) 
	{
		var type = oWall;
		var _layer = "Level_Base";
	}
	else
	{
		var type = oRope;
		var _layer = "First_layer";
	}
	
	for (var i = 0; i + tile_h <= length; i += tile_h) {

		if ( i == 0 ) && (instance_position(_x, _y, oWall) != noone)
			continue;
		
		var inst = instance_create_layer(_x, _y - i, _layer, type);
	
		if (type == oWall) array_push(walls, inst);
		if (type == oRope) array_push(ropes, inst);
	}
	
	if (type == oRope) && (instance_position(_x, _y - i, oWall) != noone)
	{
		var inst = instance_create_layer(_x, _y - i, "First_layer", oRope);
		array_push(ropes, inst);
	}
	
	if (type == oRope) && (instance_position(_x, _y - i, oWall) == noone) && (instance_position(_x, _y - i, oRope) == noone)
		{
			var inst = instance_create_layer(_x, _y - i, "Level_Base", oWall);
			
			array_push(walls, inst);
			
			var inst = instance_create_layer(_x, _y - i, "First_layer", oRope);
			
			array_push(ropes, inst);
		}
	
}

// Start of the algorithm itself

for (var i = 0; i < n_col; i++) {
	for (var j = 0; j < n_row; j++) {
		rooms[i][j] = -1;
	}
}

start_x = irandom(n_col - 1);

start_y = irandom(n_row - 1);

rooms[start_x][start_y] = -2

function explore(prev_x, prev_y, _x, _y, other_point_x, other_point_y) {
	if (rooms[_x][_y] != -2) rooms[_x][_y] = n_col * prev_x + prev_y;
	
	var current_point_x = irandom_range( room_w * _x + 2 * tile_h, room_w * (_x + 1) - 1 - 2 * tile_h ) div tile_h * tile_h;
	var current_point_y = irandom_range( room_h * _y + 2 * tile_h, room_h * (_y + 1) - 1 - 2 * tile_h ) div tile_h * tile_h + 2 * tile_h;
	
	if (other_point_x != -1) && (other_point_y != -1) 
	{
		var _length = abs(current_point_x - other_point_x);
		var _height = abs(current_point_y - other_point_y);
		
		if ( irandom_range(0,1) == 0 ) 
		{
			if ( current_point_x > other_point_x )
			{
				var p_x = other_point_x;
				var p_y = other_point_y;
			}
			else
			{
				var p_x = current_point_x;
				var p_y = current_point_y;
			}
			
			var max_x = max(current_point_x, other_point_x);
			var max_y = max(current_point_y, other_point_y);
			
			put_platform(p_x, p_y, _length);
			put_ladder(max_x, max_y, _height);
		}
		else
		{
			if ( current_point_y > other_point_y )
			{
				var p_x = current_point_x;
				var p_y = current_point_y;
			}
			else
			{
				var p_x = other_point_x;
				var p_y = other_point_y;
			}
			
			var min_x = min(current_point_x, other_point_x);
			var min_y = min(current_point_y, other_point_y);
			
			put_ladder(p_x, p_y, _height);
			put_platform(min_x, min_y, _length);
		}
	}
	else 
	{
		var p_length = irandom_range(room_w * .25, room_w * .75 );
		
		put_platform( _x * room_w, _y * room_h, p_length );
	}
	
	var move = [1, 2, 3, 4];
	
	while ( array_length(move) != 0 ) {
		var r_index = irandom(array_length(move) - 1);
		
		var next = move[r_index];
		
		array_delete(move, r_index, 1);
		
		if ( next == 1 ) && ( _x + 1 < n_col ) && ( rooms[_x + 1][_y] == -1 )
			explore( _x, _y, _x + 1, _y, current_point_x, current_point_y );
		
		if ( next == 2 ) && ( _y + 1 < n_row ) && ( rooms[_x][_y + 1] == -1 )
			explore( _x, _y, _x, _y + 1, current_point_x, current_point_y );
		
		if ( next == 3 ) && ( _x - 1 >= 0 ) && ( rooms[_x - 1][_y] == -1 )
			explore( _x, _y, _x - 1, _y, current_point_x, current_point_y );
		
		if ( next == 4 ) && ( _y - 1 >= 0 ) && ( rooms[_x][_y - 1] == -1 )
			explore( _x, _y, _x, _y - 1, current_point_x, current_point_y );
	}
}

explore(-1, -1, start_x, start_y, -1, -1);

// Random Platforms

for (var i = 0; i < level_w; i += tile_h) 
{
	for (var j = 2 * tile_h; j < level_h; j += tile_h) 
	{
		var noise = perlin_noise( i / random(1), j / random(1), random(1));

		if (instance_position(i, j, oBase_Level_Object) == noone) && ( noise < -.6 ) {
			
			var platform_length = irandom_range( room_w * .25, room_w * .75 ) div tile_h * tile_h
			
			put_platform( i, j, platform_length );
			
			var ladder_x = irandom_range( i, i + platform_length ) div tile_h * tile_h ;
			
			var inst = instance_create_layer(ladder_x, j, "First_layer", oRope);
			
			array_push(ropes, inst);
			
			var offset = 64;
			
			while (instance_position(ladder_x, j + offset, oBase_Level_Object) != noone) && ( j + offset < level_h ) 
			{
				var inst = instance_create_layer(ladder_x, j + offset, "First_layer", oRope);
				
				array_push(ropes, inst);
				
				offset += tile_h;
			}
		}
	}
}

// Flora Placer

function free_space_check(_x, _y, _w, _h, type, below = false) {
	
	if (_w == 3) var tree = true; else var tree = false;
	
	for ( var i = 0; i < _w; i++ ) 
	{
		for ( var j = 0; j < _h; j++ ) 
		{
			
			if (below)
			{
				var tile = -tile_h;
				var calc_j = -j; 
			}
			else 
			{
				var tile = tile_h;
				var calc_j = j;
			}
			
			var _x_norm = _x + i * tile_h;
			
			var _y_norm = _y - calc_j * tile_h;
			
			if  (j == 0) && (instance_position(_x_norm, _y + tile, oWall) == noone)
				return false;
			
			if (instance_position(_x_norm, _y_norm, oWall) != noone) || 
			(( _x_norm > level_w ) || ( _x_norm < 0 )) && 
			(( _y_norm > level_h ) || ( _y_norm < 0 ))
				return false;
		}
	}
	
	if (instance_position(_x, _y, type) != noone)
		return false;
	
	return true;
}

for ( var i = 0; i < array_length(walls); i++ ) {
	var wall = walls[i];
	
	if (free_space_check( wall.x, wall.y - tile_h, 3, 3, oFlora )) && (random(1) < .015)
	{
		var inst = instance_create_layer(wall.x, wall.y - 4 * tile_h, "Flora", oTree);
		array_push(flora, inst);
	}
		
	if (free_space_check( wall.x, wall.y - tile_h, 2, 1, oFlora )) && (random(1) < .025)
	{
		var inst = instance_create_layer(wall.x, wall.y - tile_h, "Flora", oBush_1);
		array_push(flora, inst);
	}
		
	if (free_space_check( wall.x, wall.y - tile_h, 1, 2, oFlora )) && (random(1) < .025)
	{
		var inst = instance_create_layer(wall.x, wall.y - 2 * tile_h, "Flora", oBush_2);
		array_push(flora, inst);
	}
		
	if (free_space_check( wall.x, wall.y - tile_h, 1, 1, oFlora )) && (random(1) < .75)
	{
		var inst = instance_create_layer(wall.x, wall.y - tile_h, "Flora", oGrass);
		array_push(flora, inst);
	}
		
	if (free_space_check( wall.x, wall.y + tile_h, 2, 1, oFlora, true )) && (random(1) < .085)
	{
		var inst = instance_create_layer(wall.x, wall.y + tile_h, "Flora", oVine_1);
		array_push(flora, inst);
	}
	
	if (free_space_check( wall.x, wall.y + tile_h, 1, 2, oFlora, true )) && (random(1) < .085)
	{
		var inst = instance_create_layer(wall.x, wall.y + tile_h, "Flora", oVine_2);
		array_push(flora, inst);
	}
}

// Enemy Spawner

function spawn_enemy() {
	
	max_x = (oPlayer.x + level_w / 8) div tile_h * tile_h;
	min_x = (oPlayer.x - level_w / 8) div tile_h * tile_h;
	
	min_y = (oPlayer.y + level_h / 8) div tile_h * tile_h;
	max_y = (oPlayer.y - level_h / 8) div tile_h * tile_h;
	
	for ( var i = min_x; i < max_x; i+=64 )
	{
		for ( var j = min_y; j > max_y; j-=64 ) 
		{
			
			if (random(1) > 0.9) && (instance_position(i, j, oWall) != noone) && (instance_position(i, j - tile_h, oWall) == noone)
			{
				var inst = instance_create_layer(i, j - tile_h + 1, "Enemies", oDroid);
				array_push(enemies, inst);
				
				return;
			}
		}
	}

}

// Player Spawner

function spawn_player() {

	while (true) 
	{
			var platform = walls[irandom(array_length(walls) - 1)];
		
			if (instance_position(platform.x, platform.y, oWall) != noone) && (instance_position(platform.x, platform.y - tile_h, oWall) == noone)
			{
				global.player = instance_create_layer(platform.x, platform.y - tile_h, "Player", oPlayer);
				break;
			}
	}

}

spawn_player();


function spawn_chests() {

	while (global.chests > 0) 
	{
			var platform = walls[irandom(array_length(walls) - 1)];
		
			if (instance_position(platform.x, platform.y, oWall) != noone) && (instance_position(platform.x, platform.y - tile_h, oWall) == noone)
			{
				instance_create_layer(platform.x, platform.y - tile_h, "Chests", oChest);
				global.chests--;
			}
	}

}

spawn_chests();


// Auto Tiling

for ( var i = 0; i < array_length(walls); i++ ) {
	AutoTile(walls[i]);
}