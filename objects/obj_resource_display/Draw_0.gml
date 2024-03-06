/// @description 

var _display_x = obj_game_manager.camera_x - x_offset;
var _display_y = obj_game_manager.camera_y - y_offset;

/*
TODO:
Need to add in some math that if the value is greater than 1K that the display value becomes
the number divided by 1000 so 2,300 == 2.3K
*/

if not is_open {
	draw_sprite(
		spr_menu_resources_full,
		1,
		_display_x,
		_display_y
	);
}
else {
	draw_sprite(
		spr_menu_resources_full,
		0,
		_display_x,
		_display_y
	);
}


var _offset_x = 5;
var _column_offset = 22;
var _offset_y_ore = 20;
var _offset_y_bar = 44;

// COAL
draw_text_transformed(
	_display_x + _offset_x,
	_display_y + 6,
	"Coal",
	0.5,
	0.5,
	0
);
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
draw_text_transformed(
	_display_x + _offset_x + _column_offset,
	_display_y + 6,
	"Copp",
	0.5,
	0.5,
	0
);
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
draw_text_transformed(
	_display_x + _offset_x + _column_offset * 2,
	_display_y + 6,
	"Iron",
	0.5,
	0.5,
	0
);
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






