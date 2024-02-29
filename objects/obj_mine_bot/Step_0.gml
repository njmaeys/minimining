

// If the bot still needs to move to the location then move it
if deposit_inst != -1
	and point_distance(x, y, deposit_inst_slot.slot_x, deposit_inst_slot.slot_y) > 1
{
    move_towards_point(
		deposit_inst_slot.slot_x,
		deposit_inst_slot.slot_y,
		move_speed
	);
}
else 
{ 
	// Ensure it stops at the resource node
	speed = 0; 
	
	if deposit_inst != -1 {
		// Mine some resources
		if current_carry < max_carry 
			and deposit_inst.resource_type.base_resource_limit > 0 // Ensure the node still has resources
		{
			if next_mining_collection < deposit_inst.resource_type.mining_speed {
				next_mining_collection += mining_speed;
			}
			else {
				// Reduce the deposit and increase the carry
				deposit_inst.resource_type.base_resource_limit -= 1;
				current_carry += 1;
			
				// Reset the mining clock
				next_mining_collection = 0;
			}
		}
	}
}

