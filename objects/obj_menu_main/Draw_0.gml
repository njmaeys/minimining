/// @description 


var _display_x = obj_game_manager.camera_x + x_offset;
var _display_y = obj_game_manager.camera_y - y_offset;


if not is_open {
	menu_closed_toggle(_display_x, _display_y);
}
else {
	menu_open_toggle(_display_x, _display_y);
	
	// Tab setup
	var _tab_x = _display_x - open_width + 18;
	var _tab_y = _display_y + 8;
	var _tab_x_offset_size = 34;
	var _tab_w = 32;
	var _tab_h = 32;

	for (var _i = 0; _i < array_length(menus); _i += 1) {
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
		
		// Draw the icon
		draw_sprite(
			menus[_i].m_srp,
			0,
			_tab_x,
			_tab_y
		);
		
		// Make sure this happens last
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

	// Menu to display
	var _menu_data = menus[active_menu_slot];
	var _d_x = _m_details_x + 8;
	var _d_y = _m_details_y + 8;
	var _m_button_w = 96;
	var _m_button_h = 32;
	
	for (var _i = 0; _i < array_length(_menu_data.data); _i += 1) {
		var _mouse_on_button = mouse_hovering_location(
			_d_x,
			_d_y,
			_d_x + _m_button_w,
			_d_y + _m_button_h
		);
		
		draw_sprite_stretched(
			spr_menu,
			_mouse_on_button,
			_d_x,
			_d_y,
			_m_button_w,
			_m_button_h
		);
		
		var _t_offset_x = 3;
		var _t_offset_y = 3;
		draw_text_transformed(
			_d_x + _t_offset_x,
			_d_y + _t_offset_y,
			_menu_data.data[_i].d_title,
			0.5,
			0.5,
			0
		);

		// Button interactions are going to be different based on the menu
		menu_button_operations(_menu_data, _i, _mouse_on_button);

		// Make sure this is last
		_d_y += 40;
	}
}


