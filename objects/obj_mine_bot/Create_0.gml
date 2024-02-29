/// @description 

depth = obj_game_manager.depths.bots;



// Track the mining operations
next_mining_collection = 0;
mining_speed = 1;
max_carry = 10;
current_carry = 0;


// Movement
move_speed = 2;


// Keep track of where it is going to mine
deposit_inst = -1;
deposit_inst_slot = -1;


// Add to the available bots
array_push(
	obj_resources_manager.available_mining_bots,
	self
);


