var _str = "Cost: ";
_str += string(chest_cost);

if (instance_exists(oPlayer) and !chest_bought){
	if (place_meeting(x, y, oPlayer)) {
		text_x = text_x mod 1000;
		if (text_x < 30){
			text_x += 200;
		}
		text_y = text_y mod 200;
		draw_text(text_x, text_y, _str);
		//show_debug_message("X: {0}, Y: {1}", text_x, text_y);
		
		if (keyboard_check_pressed(vk_alt)) {
			if (global.money >= 2) {
				
				var items = ds_map_keys_to_array(global.item_list);
				
				item_id = irandom_range(0, global.all_items - 1);
				
				var item_key = items[item_id];
				
				var item = ds_map_find_value(global.item_list, item_key);
					
				if (item.item_id == item_id) {
					objectInstance = item.object;
					chest_bought = true;
				}
				
			}
		}
	}
}

