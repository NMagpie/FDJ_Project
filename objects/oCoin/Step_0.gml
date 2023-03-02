vy += grav;
// Horizontal Collision

if (place_meeting(x + vx, y, oWall)) {
	while ((!place_meeting(x + sign(vx), y, oWall))) 
{
	x += sign(vx);
}
	vx = 0;
}

// Vertical Collision

if (place_meeting( x, y + vy, oWall )) {
	if (vy > 0) {
		done = 1;
		image_index = 3;
	}
	while ((!place_meeting(x, y + sign(vy), oWall))) {
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

if (vx != 0) image_xscale = sign(vx);