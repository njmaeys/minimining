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



