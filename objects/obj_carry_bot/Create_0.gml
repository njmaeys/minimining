/// @description 

depth = obj_game_manager.depths.bots;


// Track where it is going to need to go to and return to
home_inst = -1;
drop_off_inst = instance_nearest(x, y, obj_drop_off);


// Movement
move_speed = 1;
prev_x = x;


// Carry stuff
pick_up_and_drop_off_speed = 20; // 60 Incrase as needed
current_pick_up_and_drop_off_speed = 0;
base_max_carry_amount = 2;
max_carry_amount = 2;
current_carry_amount = 0;
currently_carrying = -1;
resources_needed = -1;
dropping_off_resources = false;
collecting_resources = false;


