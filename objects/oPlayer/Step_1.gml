if hp < 1 && death_counter == -1
{
	death_counter = 1.5 * 60;
	
	sprite_index = sDeath;
	
	image_speed = 1;
}

if death_counter > 0 death_counter--;

if death_counter == 0 
{
	image_speed = 0;
	image_index = 5;
	instance_destroy(self);
}

if (x > global.level.level_w) || (x < 0) || (y > global.level.level_h) || (y < -2000)
	instance_destroy(self);