/// @description 

depth = obj_game_manager.depths.bots;


// Add to the available construction bots
array_push(
	obj_resources_manager.available_construction_bots,
	self
);


// Thing to construct
move_speed = 1;
item_to_construct = -1;


// Home location
// TODO: Set up the home of where it needs to go.
// I'll probably just use the main building to store construction bots
home_x = obj_main_building.x + (obj_main_building.sprite_width / 2)
home_y = obj_main_building.y + (obj_main_building.sprite_height / 2)





