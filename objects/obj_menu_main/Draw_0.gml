/// @description 


var _display_x = obj_game_manager.camera_x + x_offset;
var _display_y = obj_game_manager.camera_y - y_offset;


if not is_open {
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
else {
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
	
	// TODO: I want to make this a different close thing
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
	
	// Tab setup
	var _tab_x = _display_x - open_width + 18;
	var _tab_y = _display_y + 8;
	var _tab_x_offset_size = 34;
	var _tab_w = 32;
	var _tab_h = 32;

	for (var _i = array_length(menus)-1; _i >= 0; --_i) {
		var _mouse_on_tab_header = mouse_hovering_location(
			_tab_x,
			_tab_y,
			_tab_x + _tab_w,
			_tab_y + _tab_h
		);
		
		var _highlight_tab = 0;
		if _mouse_on_tab_header
			or _i == active_menu_slot 
		{
			_highlight_tab = 1;
		}
		
		draw_sprite_stretched(
			spr_menu,
			_highlight_tab,
			_tab_x,
			_tab_y,
			_tab_w,
			_tab_h
		);
		
		// Set it to active if clicked
		if _mouse_on_tab_header
			and mouse_check_button_pressed(mb_left) 
		{
			active_menu_slot = _i;
		}
		
		_tab_x += _tab_x_offset_size;
	}
	
	// Menu details container
	var _m_details_x = _display_x - open_width + 18;
	var _m_details_y = _tab_y + 32;
	var _m_details_w = 134;
	var _m_details_h = 256;
	draw_sprite_stretched(
		spr_menu,
		0,
		_m_details_x,
		_m_details_y,
		_m_details_w,
		_m_details_h
	);
}


