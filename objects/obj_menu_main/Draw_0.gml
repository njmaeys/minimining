/// @description 


var _display_x = obj_game_manager.camera_x + x_offset;
var _display_y = obj_game_manager.camera_y - y_offset;


if not is_open {
	var _close_x_offset = 8;
	mouse_hovering = mouse_hovering_location(
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
	
	if mouse_hovering {
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
	mouse_hovering = mouse_hovering_location(
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
	draw_rectangle(
		_display_x - open_width + 11,
		_display_y + 2,
		_display_x - open_width + 11,
		_display_y + height - 3,
		false
	);
	
	// TODO: I want to make this a different close thing
	if mouse_hovering {
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


