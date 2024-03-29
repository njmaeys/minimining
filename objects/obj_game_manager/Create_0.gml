/// @description


// Treat this as a camera tracker and then let the player obj update it
camera_x = -1;
camera_y = -1;


// Mouse things
mouse_has_item = false;
obj_on_mouse = -1;

// Detphs
depths = {
	placement_objs: -10000,
	placement_hovers: -20000,
	bots: -30000,
	meunus: -60000,
}


// Border
show_border = true;
scale = 2;
scale_max = 3;
scale_min = 1;


// Track what moves the overall game window
mx = 0;
my = 0;
posx = 0;
posy = 0;


// Track the overal important things
main_progression_items = {
	current_money: 0,
	current_power: 0,
	current_coal: 0,
	current_copper_ore: 0,
	current_iron_ore: 0,
	current_copper_bars: 0,
	current_iron_bars: 0,
}

