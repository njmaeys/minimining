/// @description


// Item Spr
item_spr = spr_dummy_12;
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


// Bot check - Is drop off so has no bot
resource_type = -1;
spawns_bot = true; // Has carry bots
power_multiplier = 3;
my_bot = {
	inst_obj_type: obj_carry_bot,
	inst: -1, // Set upon placement which tracks the actual obj in the world
	level: 1,
	current_power: 0,
	max_power: 3600 * power_multiplier, // 1 min * number of min power multiplier allows
	bot_speed: 1, // Increase with level
	bot_x: -1,
	bot_y: -1,
}

// Smelting is set to an ore type
base_smelt_speed = 1800 // TODO: Set this in a manager and manipulate later
ore_to_smelt = -1;
what_to_make = "copper_bar"; // Force as copper for now while I work it out
smelting_recipe = -1;
smelting_multiplier = 1; // Incrase this to smelt faster
currently_smelting = false;
current_resources = {
	coal: 0,
	copper_ore: 0,
	iron_ore: 0,
}


// TODO: Move this to a step on a function with mouse interactions
switch what_to_make {
	case "copper_bar":
		smelting_recipe = copy_struct(obj_resources_manager.smelting_recipes.copper_bar);
}

