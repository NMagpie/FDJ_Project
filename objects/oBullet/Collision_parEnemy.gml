with (other) {
	isHurt = true
	hp -= global.player.damage;
	flash = 4;
	hitform = other.direction;
}

instance_destroy();