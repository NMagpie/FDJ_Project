key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left;

vx = move * walkv;

if (!ladder)
	vy += grav;

if (place_meeting( x, y + 1, oWall)) && (key_jump) 
{
	vy += -16;
}

if ( key_up || key_down )
{
	if (place_meeting(x, y + 1, oRope)) ladder = true;
}

// Ladder Use

if (ladder)
{
	vy = 0;
	
	vx = 0;
	
	if (key_up) vy = -7;
	
	if (key_down) vy = 7;
	
	if !place_meeting(x, bbox_bottom + 1, oRope) {
		ladder = false;
		}
	
	if (key_jump) {
		ladder = false;
		vy += -16;
		}
}

// Horizontal Collision


if (place_meeting(x + vx, y, oWall) && (!ladder)) 
{
	while ((!place_meeting(x + sign(vx), y, oWall))) 
	{
		x += sign(vx);
	}
	vx = 0;
}

// Vertical Collision

if (place_meeting( x, y + vy, oWall ) && (!ladder)) 
{
	while ((!place_meeting(x, y + sign(vy), oWall))) 
	{
		y += sign(vy);
	}
	vy = 0;
}

// Untsuck from Collision

if((!ladder) && place_meeting(x, y, oWall)) {
	for(var i = 0; i < 1000; ++i) {
		//Right
		if(!place_meeting(x + i, y, oWall)) {
			x += i;
			break;
		}
		//Left
		if(!place_meeting(x - i, y, oWall)) {
			x -= i;
			break;
		}
		//Up
		if(!place_meeting(x, y - i, oWall)) {
			y -= i;
			break;
		}
		//Down
		if(!place_meeting(x, y + i, oWall)) {
			y += i;
			break;
		}
		//Top Right
		if(!place_meeting(x + i, y - i, oWall)) {
			x += i;
			y -= i;
			break;
		}
		//Top Left
		if(!place_meeting(x - i, y - i, oWall)) {
			x -= i;
			y -= i;
			break;
		}
		//Bottom Right
		if(!place_meeting(x + i, y + i, oWall)) {
			x += i;
			y += i;
			break;
		}
		//Bottom Left
		if(!place_meeting(x - i, y + i, oWall)) {
			x -= i;
			y += i;
			break;
		}
	}
}

x += vx;

y += vy;

if (keyboard_check_pressed(vk_f5))
{
	instance_destroy(global.level.id);

	global.level = instance_create_layer(0, 0, "Level_Base", oLevel);
}

// Animation