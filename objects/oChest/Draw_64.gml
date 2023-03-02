var _str = "Cost: ";
_str += string(chest_cost);

if (instance_exists(oPlayer) and !chest_bought){
	if (place_meeting(x, y, oPlayer)){
		text_x = text_x mod 1200;
		if (text_x < 30){
			text_x += 50;
		}
		text_y = text_y mod 200;
		draw_text(text_x, text_y, _str);
		//show_debug_message("X: {0}, Y: {1}", text_x, text_y);
		
		if (keyboard_check_pressed(vk_alt)){
			if (global.money >= 2){
				chest_bought = true;
				
				item_id = random_range(0, global.all_items);
				for (var i = 0; i < array_length(global.all_items); i++){
					if (i.item_id == item_id){
						objectSprite = i.sprite;
						break;
					}
				}
				
			}
		}
	}
}

