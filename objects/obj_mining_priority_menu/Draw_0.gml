/// @description 

menu_x = x + my_home_inst.sprite_width;
draw_line_color(
	menu_x + 32,
	y + 16,
	my_home_inst.my_bot.inst.x,
	my_home_inst.my_bot.inst.y,
	#16E533,
	#16E533
);
	
draw_sprite_stretched(
	spr_interaction_menu_container,
	0,
	menu_x - 1,
	y + 2,
	97,
	40
);
	
// Set up the interactive options to mine
draw_text_transformed_color(
	menu_x + 8,
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
var _option_x_base = menu_x + 3;
var _option_y_base = y + 16;
var _cur_option_x = _option_x_base;
var _option_x_offset = 24;
for (var _i = 0; _i < array_length(obj_resources_manager.mining_resource_list); _i += 1) {
	var _item = obj_resources_manager.mining_resource_list[_i];
		
	// Mouse on the item
	var _mouse_on_item = mouse_hovering_location(
		_cur_option_x,
		_option_y_base,
		_cur_option_x + 16,
		_option_y_base + 16
	);
		
	var _highlight_color = #16E533;
	var _outline_color = #676767;
	if _item == my_home_inst.my_bot.inst.resource_type 
		or _mouse_on_item
	{
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
		
	// Draw the icon
	var _spr_to_draw = spr_icon_any;
	switch _item {
		case "coal":
			_spr_to_draw = spr_coal_icon;
		break;
			
		case "copper":
			_spr_to_draw = spr_copper_icon;
		break;
			
		case "iron":
			_spr_to_draw = spr_iron_icon;
		break;
	}
		
	draw_sprite_stretched(
		_spr_to_draw,
		0,
		_cur_option_x,
		_option_y_base,
		16,
		16
	);
		
	// Set the new resource type for the bot
	if _mouse_on_item 
		and mouse_check_button_pressed(mb_left)
	{
		// Reset the bot mining deposit if it's not the same type
		if my_home_inst.my_bot.inst.resource_type != _item {
			my_home_inst.my_bot.inst.resource_type = _item;
			my_home_inst.my_bot.inst.currently_mining = false;
			my_home_inst.my_bot.inst.currently_dropping_off = true;
			my_home_inst.my_bot.inst.swap_resource_type = true;
		}
	}
		
	// Make sure last
	_cur_option_x += _option_x_offset;
}




