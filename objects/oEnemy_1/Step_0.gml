vy += grav
if (!isHurt and flash == 0){
	image_index = 1;
} else {
	image_index = 0;
}
// Horizontal Collision

//move_towards_point(oPlayer.x, oPlayer.y, 5);

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

// Animation
if (place_meeting(x, y+1, oWall)){	
	image_speed = 1;
	if (vx == 0){
		sprite_index = sEnemy;
	} else {
		sprite_index = sEnemyR;
	}
}

if (vx != 0) image_xscale = sign(vx);