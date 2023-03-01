if (hp <= 0){
	with(instance_create_layer(x, y, layer, oDead)){
		direction = other.hitform;
		vx = lengthdir_x(3, direction);
		vy = lengthdir_y(3, direction) - 2;
		image_xscale = sign(vx);
		if (sign(vx) != 0) image_xscale = sign(vx);
		instance_create_layer(x, y, "Coins", oCoin);
	}
	
	instance_destroy();
}