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
	and not instance_exists(obj_mining_priority_menu)
{	
	var _temp_home = self;
	with instance_create_depth(
		x,
		y,
		obj_game_manager.depths.meunus,
		obj_mining_priority_menu
	) {
		my_home_inst = _temp_home;
	}
}
