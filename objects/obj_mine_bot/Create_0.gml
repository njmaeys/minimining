/// @description 

depth = obj_game_manager.depths.bots;


// Home location
home_inst = -1;
home_x = 0;
home_y = 0;
return_home = false;


// Track the mining operations
next_mining_collection = 0;
mining_speed = 1;
max_carry = 10;
current_carry = 0;


// Movement
prev_x = x;
move_speed = 1;


// Keep track of where it is going to mine
drop_off_speed = 20; //60; Increase this as needed
current_drop_off_speed = 0;
deposit_inst = -1;
deposit_inst_slot = -1;
drop_off_inst = -1;
currently_dropping_off = false;


// Purchase
purchase_cost = 100;


// Add to the available bots
array_push(
	obj_resources_manager.available_mining_bots,
	self
);


