function num_mining_spots(_width, _height) {
	var _base_square = 32;
	var _w = _width / _base_square;
	var _h = _height / _base_square;
	
	return _w * _h;
}

function set_minable_slots() {
	mineable_slots = [];
	
	var _x_offset = x + 16;
	var _y_offset = y + 8;
	
	for (var _i = 0; _i < minable_slots_available; _i += 1)
	{
		if (item_spr_w / 32 == 2 and _i == 2)
			or (
				item_spr_w / 32 == 3 
				and (_i == 3 or _i == 6)
			)
		{
			_x_offset = x + 16;
			_y_offset += 32;
		}
		
		array_push(
			mineable_slots, 
			{
				slot_x: _x_offset,
				slot_y: _y_offset,
				bot_inst: -1,
			}
		);
		
		_x_offset += 32;
	}
}


function ore_deposit_find_bot() {
	// If there is nothing left to mine then just return
	if resource_type.base_resource_limit == 0 {
		return;
	}
	
	var _fill_slot = -1;
	for (var _i = 0; _i < minable_slots_available; _i += 1) {
		var _item = mineable_slots[_i];
		
		if _item.bot_inst == -1 {
			_fill_slot = _item;
			_fill_slot.index = _i;
			break;
		}
	}
	
	//show_debug_message($"Dep ID: {id} | Fill slot: {_fill_slot} | Num bots: {array_length(obj_resources_manager.available_mining_bots)}");
	
	
	if _fill_slot != -1 {
		if array_length(obj_resources_manager.available_mining_bots) > 0 {
			for (var _i = 0; _i < array_length(obj_resources_manager.available_mining_bots); _i += 1) {
				var _temp_bot = obj_resources_manager.available_mining_bots[_i];
		
				if resource_type.resource_type == _temp_bot.resource_type 
					or _temp_bot.resource_type == "any" // Allow wild card bassically
				{	
					array_delete(
						obj_resources_manager.available_mining_bots,
						_i,
						1
					);
		
					mineable_slots[_fill_slot.index].bot_inst = _temp_bot;
					_temp_bot.deposit_inst = self;
					_temp_bot.deposit_inst_slot = _fill_slot;
					
					break;
				}
			}
		}
	}
}


function find_construction_bot() {
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


function resource_reduction() {
	//draw_text(
	//	x-8,
	//	y-16,
	//	resource_type.base_resource_limit
	//);
}


function increase_global_resource() {

	switch (deposit_inst.resource_type.resource_name) {
		// Coal
		case "coal_small":
			obj_game_manager.main_progression_items.current_coal += 1;
		break;
			
		case "coal_medium":
			obj_game_manager.main_progression_items.current_coal += 1;
		break;
			
		case "coal_large":
			obj_game_manager.main_progression_items.current_coal += 1;
		break;
		
		// Copper
		case "copper_ore_small":
			obj_game_manager.main_progression_items.current_copper_ore += 1;
		break;
	}
}


function load_to_carry_bot(_resource_name) {
	if current_pick_up_and_drop_off_speed < pick_up_and_drop_off_speed {
		current_pick_up_and_drop_off_speed += 1;
	}
	else {
		current_carry_amount += 1;
		
		switch _resource_name {
			case "coal":
				obj_game_manager.main_progression_items.current_coal -= 1
			break;
			
			case "copper_ore":
				obj_game_manager.main_progression_items.current_copper_ore -= 1
			break;
		}
		
		// Reset drop off speed
		current_pick_up_and_drop_off_speed = 0;
	}
}


function offload_from_carry_bot(_resource_name) {
	if current_pick_up_and_drop_off_speed < pick_up_and_drop_off_speed {
		current_pick_up_and_drop_off_speed += 1;
	}
	else {
		current_carry_amount -= 1;
		
		switch _resource_name {
			case "coal":
				home_inst.current_resources.coal += 1
			break;
			
			case "copper_ore":
				home_inst.current_resources.copper_ore += 1
			break;
		}
		
		// Reset drop off speed
		current_pick_up_and_drop_off_speed = 0;
	}
}