vy += grav

if (!isHurt and flash == 0) {
	image_speed = 1;
} else {
	sprite_index = sDroidDamaged_and_death;
	image_index = 1;
}

// Horizontal Collision

if facing == 1
	var x_bbox = bbox_right;
else
	var x_bbox = bbox_left;
	
if instance_exists(target)
	vx = ( sign( target.x - x ) ) * walkv;
	
var can_walk = place_meeting(x_bbox + vx, bbox_bottom + 1, oWall);

var can_fall = false;

if !can_walk
	for ( var i = 1; i < 10; i++ )
	{
		if place_meeting(x_bbox + vx, bbox_bottom + i * global.level.tile_h + 1, oWall) {
			can_fall = true;
			break;
		}
	}

if !can_fall && !can_walk
	vx = 0;

if (instance_exists(target)) && can_fall && sign( target.y - y ) < 0
	vx = 0;
		

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

if (!isHurt)
	if (place_meeting(x, y + 1, oWall)) {	
		if (vx == 0) {
			sprite_index = sDroidRun;
			image_index = 0;
			image_speed = 0;
		} else {
			sprite_index = sDroidRun;
			image_speed = 1;
		}
	}

if (vx != 0) facing = sign(vx);