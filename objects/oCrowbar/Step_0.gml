sprite_index = item.sprite;

vy += grav;
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
	if (vy > 0) {
		done = 1;
		image_index = 3;
	}
	while ((!place_meeting(x, y + sign(vy), oWall))) 
	{
		y += sign(vy);
	}
	vy = 0;
}

x += vx;

y += vy;

// Animation

if (vx != 0) image_xscale = sign(vx);

if place_meeting(x, y, oPlayer){
	item_add(item);
	instance_destroy();
}