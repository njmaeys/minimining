/// @description 


// Ensure power stays at the minimum
if obj_game_manager.main_progression_items.current_power <= min_power {
	obj_game_manager.main_progression_items.current_power = min_power;
}


//for (var _i = 0; _i < array_length(available_mining_bots); _i += 1) {
//	var _temp = available_mining_bots[_i];
//	show_debug_message($"Bot ID: {_temp.id} | Rec Type: {_temp.resource_type}");
//}
//show_debug_message("\n");

