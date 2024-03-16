/// @description 



// Draw highlight
if mouse_hovering 
	and not obj_game_manager.mouse_has_item
{
	draw_rectangle_color(
		x - 1,
		y + 1,
		x + sprite_width,
		y + sprite_height,
		c_white,
		c_white,
		c_white,
		c_white,
		false
	);
	
	if mouse_check_button_pressed(mb_left) 
		and placement_cooldown <= 0
	{
		draw_line_to_bot = !draw_line_to_bot;
	}
}


if is_placed {
	draw_self();
}
else {
	can_be_placed = can_be_placed_check();
	draw_placement_hover_indicator();
}


// Draw the interactive menu and line to the bot
if my_bot.inst != -1 
	and draw_line_to_bot
{	
	var _menu_x = x + sprite_width;
	draw_line_color(
		_menu_x + 32,
		y + 16,
		my_bot.inst.x,
		my_bot.inst.y,
		#16E533,
		#16E533
	);
	
	draw_sprite_stretched(
		spr_interaction_menu_container,
		0,
		_menu_x - 1,
		y + 2,
		97,
		40
	);
	
	// Set up the interactive options to mine
	draw_text_transformed_color(
		_menu_x + 8,
		y + 3,
		"Resource Priority",
		0.5,
		0.5,
		0,
		c_black,
		c_black,
		c_black,
		c_black,
		1
	);
	
	// Draw the options to choose from
	var _option_x_base = _menu_x + 3;
	var _option_y_base = y + 16;
	var _cur_option_x = _option_x_base;
	var _option_x_offset = 24;
	for (var _i = 0; _i < array_length(obj_resources_manager.mining_resource_list); _i += 1) {
		var _item = obj_resources_manager.mining_resource_list[_i];
		show_debug_message(_item);
		
		var _highlight_color = #16E533;
		var _outline_color = #676767;
		if _item == my_bot.inst.resource_type {
			_outline_color = _highlight_color;
		}
		
		draw_rectangle_color(
			_cur_option_x,
			_option_y_base,
			_cur_option_x + 16,
			_option_y_base + 16,
			_outline_color,
			_outline_color,
			_outline_color,
			_outline_color,
			true
		);
		
		// Make sure last
		_cur_option_x += _option_x_offset;
	}
}
