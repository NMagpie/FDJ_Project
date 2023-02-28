key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

key_jump = keyboard_check_pressed(vk_space);

var move = key_right - key_left;

vx = move * walkv;

vy += grav;

if (place_meeting( x, y + 1, oWall)) && (key_jump) 
{
	vy += -14;
}

// Horizontal Collision

if (place_meeting(x + vx, y, oWall)) 
{
	while ((!place_meeting(x + sign(vx), y, oWall))) 
	{
		x += sign(vx);
	}
	vx = 0;
}

// Vertical Collision

if (place_meeting( x, y + vy, oWall )) 
{
	while ((!place_meeting(x, y + sign(vy), oWall))) 
	{
		y += sign(vy);
	}
	vy = 0;
}

x += vx;

y += vy;

if (keyboard_check_pressed(vk_f5))
{
	instance_destroy(global.level.id);

	global.level = instance_create_layer(0, 0, "Instances", oLevel);
}