/// @description 

// Item Spr
item_spr = spr_mining_bot_platform;
item_spr_w = sprite_get_width(item_spr);
item_spr_h = sprite_get_height(item_spr);


// Setup
hover_item_setup();

// Placements
is_placed = false;
can_be_placed = true;
placement_x = -1;
placement_y = -1;
hover_x = -1;
hover_y = -1;


// Mouse
mouse_hovering = false;
placement_cooldown = 5; // Damn click thing too fasts



// Track the placements bot
spawns_bot = true;
power_multiplier = 3;
my_bot = {
	inst_obj_type: obj_mine_bot,
	inst: -1, // Set upon placement which tracks the actual obj in the world
	level: 1,
	current_power: 0,
	max_power: 3600 * power_multiplier, // 1 min * number of min power multiplier allows
	bot_speed: 1, // Increase with level
	bot_x: -1,
	bot_y: -1,
}
draw_line_to_bot = false;




