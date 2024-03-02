/// @description 


if not is_placed {
	place_item_on_map();
}


if currently_smelting {
	if current_smelt_time != smelting_recipe.cook_time {
		current_smelt_time += smelting_multiplier;
	}
	else {
		current_smelt_time = 0;
		currently_smelting = false;
		
		switch what_to_make {
			case "copper_bar":
				obj_game_manager.main_progression_items.current_copper_bars += 1;
				
				// Reset the recipe to it's base
				current_resources.coal -= smelting_recipe.coal;
				current_resources.copper_ore -= smelting_recipe.copper_ore;
			break;
		}
	}
}



