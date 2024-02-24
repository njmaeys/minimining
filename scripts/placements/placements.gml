
function hover_item_setup() {
	_grid_size = 32; // Gap between each snap point
	_grid_x_offset = 0;
	_grid_y_offset = 0;
}



function draw_placement_hover_indicator() {
	var _img_index = 0;
	if not can_be_placed {
		_img_index = 1;
	}
	
	draw_sprite_stretched(
		spr_placement_hover,
		_img_index,
		x,
		y,
		item_spr_w,
		item_spr_h
	);
	
	var _xo = _grid_x_offset + round((mouse_x - (item_spr_w * 0.5)) / _grid_size) * _grid_size;
	var _yo = _grid_y_offset + round((mouse_y - (item_spr_h * 0.5)) / _grid_size) * _grid_size;

	x = _xo;
	y = _yo;
}


function place_item_on_mouse(_obj) {
	if not obj_game_manager.mouse_has_item {
		obj_game_manager.mouse_has_item = true;
	}
	
	obj_game_manager.obj_on_mouse = instance_create_depth(
		mouse_x,
		mouse_y,
		obj_game_manager.depths.placement_hovers,
		_obj
	);
}


function remove_item_from_mouse() {
	instance_destroy(obj_game_manager.obj_on_mouse);
	
	obj_game_manager.obj_on_mouse = -1;
	obj_game_manager.mouse_has_item = false;
}


function place_item_on_map() {
	if mouse_check_button_pressed(mb_left) 
		and can_be_placed
	{
		var _place_x = x;
		var _place_y = y;
		var _obj_index = obj_game_manager.obj_on_mouse.object_index;
		
		
		var _temp = obj_game_manager.obj_on_mouse;
		_temp.depth = obj_game_manager.depths.placement_objs;
		_temp.is_placed = true;
		_temp.placement_x = _place_x;
		_temp.placement_y = _place_y;
		
		
		// Spawn the instance of the bot
		if _temp.spawns_bot {
			var _center_x = placement_x + _temp.item_spr_w / 2;
			var _center_y = placement_y + _temp.item_spr_h / 2;
			
			var _bot_inst = instance_create_depth(
				_center_x,
				_center_y,
				obj_game_manager.depths.placement_objs,
				_temp.my_bot.inst_obj_type
			);
			
			_temp.my_bot.inst = _bot_inst;
		}
		
				
		obj_game_manager.mouse_has_item = false;
		obj_game_manager.obj_on_mouse = -1;
	}
}


function can_be_placed_check() {
	// Top left
	if place_meeting(
		bbox_left,
		bbox_top,
		obj_par_placement
	) { return false; }

	return true;
}


function rotate_obj() {
	if keyboard_check_pressed(ord("R")) {
		image_angle += 90;
		show_debug_message($"Rotate: {image_angle}")
		
		if image_angle >= 360 {
			image_angle = 0;
		}
	}
}
