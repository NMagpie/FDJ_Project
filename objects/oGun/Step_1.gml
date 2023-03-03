/// @description 

// check player direction to move gun respectively
if (instance_exists(global.player)) {
	if oPlayer.look_direction var gun_direction = oPlayer.bbox_right; else var gun_direction = oPlayer.bbox_left;

x = gun_direction + 10;
y = oPlayer.y + 10;

}
else
	instance_destroy();

image_angle = point_direction(x, y, mouse_x, mouse_y);

firingdelay -= 1;
recoil = max(0, recoil - 1);

if (mouse_check_button(mb_left)) and (firingdelay < 0){
	recoil = 4;
	firingdelay = 5;
	with (instance_create_layer(x, y, "Bullets", oBullet)){
		speed = 25;
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}

x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

if (image_angle > 90) and (image_angle < 270){
	image_yscale = -1
} else {
	image_yscale = 1
}