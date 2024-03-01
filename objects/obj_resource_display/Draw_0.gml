/// @description 

var _display_x = obj_game_manager.camera_x - x_offset;
var _display_y = obj_game_manager.camera_y - y_offset;

draw_text(
	_display_x,
	_display_y,
	$"Coal: {obj_game_manager.main_progression_items.current_coal}"
);
draw_text(
	_display_x,
	_display_y + 16,
	$"Copper Ore: {obj_game_manager.main_progression_items.current_copper_ore}"
);






