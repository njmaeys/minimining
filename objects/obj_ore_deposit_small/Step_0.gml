
if not is_placed {
	place_item_on_map();
}


if mineable_slots != -1 {
	if needs_to_be_constructed {
		// TODO: Move to function
		if array_length(obj_resources_manager.available_construction_bots) > 0 {
			var _temp_bot = obj_resources_manager.available_construction_bots[0];
			array_delete(
				obj_resources_manager.available_construction_bots,
				0,
				1
			);
		
			_temp_bot.item_to_construct = self;
		}
	}
	else {
		ore_deposit_find_bot();
	}
}


if resource_type.base_resource_limit == 0 {
	image_index = 1;
}


