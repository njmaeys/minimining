/// @description 




if keyboard_check_pressed(ord("M")) {
	if not obj_game_manager.mouse_has_item {
		place_item_on_mouse(obj_mine_bot_placement);
	}
}


if keyboard_check_pressed(ord("R")) {
	obj_resource_display.is_open = !obj_resource_display.is_open;
}



if keyboard_check_pressed(ord("S")) {
	if not obj_game_manager.mouse_has_item {
		place_item_on_mouse(obj_smelter);
	}
}


if keyboard_check_pressed(ord("4")) {
	if not obj_game_manager.mouse_has_item {
		place_item_on_mouse(obj_ore_deposit_small);
		
		// This is where I will set the obj resource types any time I need to but with a menu
		obj_game_manager.obj_on_mouse.resource_type = copy_struct(obj_resources_manager.mining_resource_types.copper_ore_small);
		obj_game_manager.obj_on_mouse.item_spr = spr_copper_patch_small;
		obj_game_manager.obj_on_mouse.sprite_index = spr_copper_patch_small;
	}
}
if keyboard_check_pressed(ord("3")) {
	if not obj_game_manager.mouse_has_item {
		place_item_on_mouse(obj_ore_deposit_large);
		
		// This is where I will set the obj resource types any time I need to but with a menu
		obj_game_manager.obj_on_mouse.resource_type = copy_struct(obj_resources_manager.mining_resource_types.coal_large);
		obj_game_manager.obj_on_mouse.item_spr = spr_coal_patch_large;
		obj_game_manager.obj_on_mouse.sprite_index = spr_coal_patch_large;
	}
}
if keyboard_check_pressed(ord("2")) {
	if not obj_game_manager.mouse_has_item {
		place_item_on_mouse(obj_ore_deposit_medium);
		
		// This is where I will set the obj resource types any time I need to but with a menu
		obj_game_manager.obj_on_mouse.resource_type = copy_struct(obj_resources_manager.mining_resource_types.coal_medium);
		obj_game_manager.obj_on_mouse.item_spr = spr_coal_patch_medium;
		obj_game_manager.obj_on_mouse.sprite_index = spr_coal_patch_medium;
	}
}
if keyboard_check_pressed(ord("1")) {
	if not obj_game_manager.mouse_has_item {
		place_item_on_mouse(obj_ore_deposit_small);
		
		// This is where I will set the obj resource types any time I need to but with a menu
		obj_game_manager.obj_on_mouse.resource_type = copy_struct(obj_resources_manager.mining_resource_types.coal_small);
		obj_game_manager.obj_on_mouse.item_spr = spr_coal_patch_small;
		obj_game_manager.obj_on_mouse.sprite_index = spr_coal_patch_small;
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


