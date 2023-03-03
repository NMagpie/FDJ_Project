draw_sprite_ext(sprite_index, image_index, x, y, facing, image_yscale, image_angle, c_white, image_alpha);

if (flash > 0) {
	flash--;
}

if flash == 0 isHurt = false;