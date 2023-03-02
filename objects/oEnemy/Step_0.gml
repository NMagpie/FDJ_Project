vy += grav

if (!isHurt and flash == 0){
	image_index = 1;
} else {
	image_index = 0;
}
// Horizontal Collision

//move_towards_point(oPlayer.x, oPlayer.y, 5);

if ( (place_meeting(x + vx, y + 1, oWall)) )
	vx = random_range(-1, 1) * walkv;
	//vx = ( sign( target.x - x ) ) * walkv;

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

// Untsuck from Collision
	
if place_meeting(x, y, oWall) {
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