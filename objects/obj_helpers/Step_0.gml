/// @description 



if keyboard_check_pressed(ord("C")) {
	if not obj_game_manager.mouse_has_item {
		place_item_on_mouse(obj_carry_bot);
	}
}



if keyboard_check_pressed(ord("M")) {
	if not obj_game_manager.mouse_has_item {
		place_item_on_mouse(obj_mine_bot);
	}
}



if keyboard_check_pressed(ord("D")) {
	if not obj_game_manager.mouse_has_item {
		place_item_on_mouse(obj_ore_deposit);
		
		// This is where I will set the obj resource types any time I need to but with a menu
		obj_game_manager.obj_on_mouse.resource_type = obj_resources_manager.mining_resource_types.coal;
	}
}



if keyboard_check_pressed(ord("B")) {
	obj_game_manager.show_border = !obj_game_manager.show_border;
	window_set_showborder(obj_game_manager.show_border);
}



if keyboard_check_pressed(vk_up) {
	if obj_game_manager.scale >= obj_game_manager.scale_max {
		return;
	}
    obj_game_manager.scale += 1;
    window_set_size(800 * obj_game_manager.scale, 320 * obj_game_manager.scale);
}

if keyboard_check_pressed(vk_down) {
	if obj_game_manager.scale <= obj_game_manager.scale_min {
		return;
	}
    obj_game_manager.scale -= 1;
    window_set_size(800 * obj_game_manager.scale, 320 * obj_game_manager.scale);
}


