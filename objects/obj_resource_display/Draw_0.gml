/// @description 

var _display_x = obj_game_manager.camera_x - x_offset;
var _display_y = obj_game_manager.camera_y - y_offset;

/*
TODO:
Need to add in some math that if the value is greater than 1K that the display value becomes
the number divided by 1000 so 2,300 == 2.3K
*/

if not is_open {
	mouse_hovering = mouse_hovering_location(
		_display_x,
		_display_y,
		_display_x + 72,
		_display_y + 25
	);
	
	draw_sprite(
		spr_menu_resources_full,
		1,
		_display_x,
		_display_y
	);
	
	if mouse_hovering {
		draw_set_colour(c_yellow);
		draw_rectangle(
			_display_x,
			_display_y,
			_display_x + 72,
			_display_y + 25,
			true
		);
		
		if mouse_check_button_pressed(mb_left) {
			is_open = !is_open;
		}
	}
}
else {
	mouse_hovering = mouse_hovering_location(
		_display_x,
		_display_y,
		_display_x + 73,
		_display_y + 72
	);
	
	draw_sprite(
		spr_menu_resources_full,
		0,
		_display_x,
		_display_y
	);
	
	if mouse_hovering {
		draw_set_colour(c_yellow);
		draw_rectangle(
			_display_x,
			_display_y,
			_display_x + 72,
			_display_y + 71,
			true
		);
		
		if mouse_check_button_pressed(mb_left) {
			is_open = !is_open;
		}
	}
}


var _offset_x = 5;
var _column_offset = 22;
var _offset_y_ore = 21;
var _offset_y_bar = 45;

// COAL
draw_set_color(c_white);
if is_open {
	draw_text_transformed(
		_display_x + _offset_x,
		_display_y + _offset_y_ore,
		$"Ore\n{obj_game_manager.main_progression_items.current_coal}",
		0.5,
		0.5,
		0
	);
}


// COPPER
if is_open {
	draw_text_transformed(
		_display_x + _offset_x + _column_offset,
		_display_y + _offset_y_ore,
		$"Ore\n{obj_game_manager.main_progression_items.current_copper_ore}",
		0.5,
		0.5,
		0
	);
	draw_text_transformed(
		_display_x + _offset_x + _column_offset,
		_display_y + _offset_y_bar,
		$"Bar\n{obj_game_manager.main_progression_items.current_copper_bars}",
		0.5,
		0.5,
		0
	);
}

// IRON
if is_open {
	draw_text_transformed(
		_display_x + _offset_x + _column_offset * 2,
		_display_y + _offset_y_ore,
		$"Ore\n{obj_game_manager.main_progression_items.current_iron_ore}",
		0.5,
		0.5,
		0
	);
	draw_text_transformed(
		_display_x + _offset_x + _column_offset * 2,
		_display_y + _offset_y_bar,
		$"Bar\n{obj_game_manager.main_progression_items.current_iron_bars}",
		0.5,
		0.5,
		0
	);
}






