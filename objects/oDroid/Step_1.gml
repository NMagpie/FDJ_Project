if (hp <= 0) {
	global.player._score += 100;
	
	instance_create_layer(x, y, "Coins", oCoin);
	
	instance_destroy();
}