/// @description 


if home_inst != -1 
	and object_get_name(home_inst.object_index) == "obj_smelter"
{
	// TODO: Move to function
	
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
				
				if _v != 0 {
					currently_carrying = _k;
				}
			}
			
			show_debug_message($"Carrying: {currently_carrying} | Needed {_v}");
		}
		
		// Go gather the resources
	}
}






