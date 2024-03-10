function menu_closed_toggle(_display_x, _display_y) {
	var _close_x_offset = 8;
	mouse_hovering_toggle = mouse_hovering_location(
		_display_x - _close_x_offset,
		_display_y,
		_display_x + closed_width,
		_display_y + height
	);
	
	// Main menu
	draw_sprite_stretched(
		spr_menu,
		0,
		_display_x - _close_x_offset,
		_display_y,
		closed_width,
		height
	);
	
	if mouse_hovering_toggle {
		draw_set_colour(c_gray);
		draw_set_alpha(0.5);
		draw_rectangle(
			_display_x - _close_x_offset + 1,
			_display_y + 2,
			_display_x + closed_width,
			_display_y + height - 3,
			false
		);
		draw_set_colour(c_white);
		draw_set_alpha(1);
		
		if mouse_check_button_pressed(mb_left) {
			is_open = !is_open;
			if active_menu_slot = -1 {
				active_menu_slot = 0;
			}
		}
	}

	// Arrow
	draw_sprite(
		spr_main_menu_arrow,
		0,
		_display_x - _close_x_offset + 3,
		_display_y + height / 2
	);
}

function menu_open_toggle(_display_x, _display_y) {
	mouse_hovering_toggle = mouse_hovering_location(
		_display_x - open_width,
		_display_y,
		_display_x - open_width + 8,
		_display_y + height
	);
	
	// Main menu
	draw_sprite_stretched(
		spr_menu,
		0,
		_display_x - open_width,
		_display_y,
		open_width + 8,
		height
	);

	// Divider line
	draw_set_alpha(0.3);
	draw_rectangle(
		_display_x - open_width + 11,
		_display_y + 2,
		_display_x - open_width + 11,
		_display_y + height - 3,
		false
	);
	draw_set_alpha(1);
	
	// Show that the close is being hovered
	if mouse_hovering_toggle {
		draw_set_colour(c_gray);
		draw_set_alpha(0.5);
		draw_rectangle(
			_display_x - open_width + 2,
			_display_y + 2,
			_display_x - open_width + 10,
			_display_y + height - 3,
			false
		);
		draw_set_colour(c_white);
		draw_set_alpha(1);
		
		if mouse_check_button_pressed(mb_left) {
			is_open = !is_open;
		}
	}
	
	// Arrow
	draw_sprite_ext(
		spr_main_menu_arrow,
		0,
		_display_x - open_width + 8,
		_display_y + height / 2,
		-1,
		1,
		0,
		c_white,
		1
	);
}


function menu_button_operations(_data, _index, _mouse_on_button) {
	
	switch menus[active_menu_slot].m_name {
		case "bots":
			// If the mouse already has something return
			if obj_game_manager.mouse_has_item {
				break;
			}
			
			if _mouse_on_button 
				and mouse_check_button_pressed(mb_left)
			{
				var _d = _data.data[_index]

				place_item_on_mouse(_d.bot_obj);
			}
		break;
		
		case "resources":
			// If the mouse already has something return
			if obj_game_manager.mouse_has_item {
				break;
			}
			
			// TODO: Draw the resource icon
			// TODO: Draw the cost
			
			// Place an item on the mouse
			if _mouse_on_button 
				and mouse_check_button_pressed(mb_left)
			{
				var _d = _data.data[_index]

				place_item_on_mouse(_d.resource_obj);
				obj_game_manager.obj_on_mouse.resource_type = copy_struct(_d.resource_type);
				obj_game_manager.obj_on_mouse.item_spr = _d.resource_spr;
				obj_game_manager.obj_on_mouse.sprite_index = _d.resource_spr;
			}
		break;
		
		case "buildings":
			// If the mouse already has something return
			if obj_game_manager.mouse_has_item {
				break;
			}
			
			if _mouse_on_button 
				and mouse_check_button_pressed(mb_left)
			{
				var _d = _data.data[_index]

				place_item_on_mouse(_d.building_obj);
			}
		break;
		
		case "settings":
		break;
	}
}
