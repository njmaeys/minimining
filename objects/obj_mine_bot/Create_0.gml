/// @description 


// Number of items it can carry before needing to offload
max_carry = 10;
current_carry = 0;


// Keep track of where it is going to mine
deposit_inst = -1;
deposit_inst_slot = -1;


/*

TODO:
When I come back I need to start writing the logic to get the
mining bot to find the deposit it will go to. Default to whatever
is the closest with resources remaining. Eventually allow the
player to set a different resource and then find the closest
node of that type and head off to it

*/

