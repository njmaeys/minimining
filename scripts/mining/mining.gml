function num_mining_spots(_width, _height) {
	var _base_square = 32;
	var _w = _width / _base_square;
	var _h = _height / _base_square;
	
	return _w * _h;
}

function set_minable_slots() {
	mineable_slots = [];
	
	var _x_offset = x + 16;
	var _y_offset = y + 16;
	
	for (var _i = 0; _i < minable_slots_available; _i += 1)
	{
	    if _i == 3
			or _i == 6
			or _i == 9
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
	var _fill_slot = -1;
	for (var _i = 0; _i < minable_slots_available; _i += 1) {
		var _item = mineable_slots[_i];
		
		if _item.bot_inst == -1 {
			_fill_slot = _item;
			_fill_slot.index = _i;
			break;
		}
	}
	
	if _fill_slot != -1 {
		if array_length(obj_resources_manager.available_mining_bots) > 0 {
			var _temp_bot = obj_resources_manager.available_mining_bots[0];
			array_delete(
				obj_resources_manager.available_mining_bots,
				0,
				1
			);
		
			mineable_slots[_fill_slot.index].bot_inst = _temp_bot;
			_temp_bot.deposit_inst = self;
			_temp_bot.deposit_inst_slot = _fill_slot.index;
		}
	}
}
