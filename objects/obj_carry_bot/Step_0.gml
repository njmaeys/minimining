/// @description 

// Set the sprite facing direction
target_direction();


if home_inst != -1
	and home_inst.currently_smelting 
{
	image_alpha = 0;
}
else {
	image_alpha = 1;
}


if home_inst != -1 
	and object_get_name(home_inst.object_index) == "obj_smelter"
{
	// TODO: Move to function and clean up if possible, lots of repeat code
	
	// Track how far from home and from the drop off
	var _dist_from_home = point_distance(x, y, home_inst.x, home_inst.y)
	
	var _drop_off_x = drop_off_inst.x + 32;
	var _drop_off_y = drop_off_inst.y + 32;
	var _dist_from_drop_off = point_distance(x, y, _drop_off_x, _drop_off_y);
	
	// Find out if the machine is ready to smelt
	if home_inst.currently_smelting == false 
		and home_inst.smelting_recipe != -1
	{
		// Set what needs to be gathered based on the recipe
		if home_inst.what_to_make == "copper_bar" 
			and resources_needed == -1
		{
			resources_needed = {
				coal: home_inst.smelting_recipe.coal,
				copper_ore: home_inst.smelting_recipe.copper_ore,
			}
		}
		
		// Figure out what resources need to be collected
		if resources_needed != -1 {
			var _keys = variable_struct_get_names(resources_needed);
			for (var _i = array_length(_keys)-1; _i >= 0; --_i) {
			    var _k = _keys[_i];
			    var _v = resources_needed[$ _k];
				
				if home_inst.current_resources[$ _k] < resources_needed[$ _k] {
					currently_carrying = _k;
				}
			}
		}
		
		// Go gather the resources
		if current_carry_amount < max_carry_amount
			and currently_carrying != -1
			and not dropping_off_resources
		{	
			switch currently_carrying {
				case "coal":
					if obj_game_manager.main_progression_items.current_coal <= 0 {
						break;
					}
					
					if _dist_from_drop_off > 1 {
						move_towards_point(
							_drop_off_x,
							_drop_off_y,
							move_speed
						);
					}
					else {
						speed = 0;
						
						var _needed = resources_needed.coal - home_inst.current_resources.coal;
						if _needed < max_carry_amount {
							max_carry_amount = _needed;
						}
						else {
							max_carry_amount = base_max_carry_amount;
						}

						load_to_carry_bot("coal");
					}

				break;
				
				case "copper_ore":
					if obj_game_manager.main_progression_items.current_copper_ore <= 0 {
						break;
					}
					
					if _dist_from_drop_off > 1 {
						move_towards_point(
							_drop_off_x,
							_drop_off_y,
							move_speed
						);
					}
					else {
						speed = 0;
						
						var _needed = resources_needed.copper_ore - home_inst.current_resources.copper_ore;
						if _needed < max_carry_amount {
							max_carry_amount = _needed;
						}
						else {
							max_carry_amount = base_max_carry_amount;
						}

						load_to_carry_bot("copper_ore");
					}

				break;
			}
		}
		
		// Bring resources home
		if (current_carry_amount == max_carry_amount or dropping_off_resources)
			and currently_carrying != -1
		{
			switch currently_carrying {
				case "coal":
					if _dist_from_home > 1 {
						move_towards_point(
							home_inst.x,
							home_inst.y,
							move_speed
						);
					}
					else {
						speed = 0;
						dropping_off_resources = true;
						
						offload_from_carry_bot("coal");
						
						if current_carry_amount == 0 {
							dropping_off_resources = false;
						}
					}
					
				break;
				
				case "copper_ore":
					if _dist_from_home > 1 {
						move_towards_point(
							home_inst.x,
							home_inst.y,
							move_speed
						);
					}
					else {
						speed = 0;
						dropping_off_resources = true;

						offload_from_carry_bot("copper_ore");
						
						if current_carry_amount == 0 {
							dropping_off_resources = false;
						}
					}
					
				break;
			}
		}
		
		// Check if everything matches then set smelter to smelting
		if resources_needed != -1 {
			var _count_not_ready = 0;
			var _keys = variable_struct_get_names(resources_needed);
			for (var _i = array_length(_keys)-1; _i >= 0; --_i) {
			    var _k = _keys[_i];
				var _v = resources_needed[$ _k];
				
				if resources_needed[$ _k] != home_inst.current_resources[$ _k] {
					_count_not_ready += 1;
				}	
			}
			
			if _count_not_ready == 0 {
				home_inst.currently_smelting = true;
			}
		}
	}
}






