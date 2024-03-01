

// If the bot still needs to move to the location then move it
if deposit_inst != -1
	and point_distance(x, y, deposit_inst_slot.slot_x, deposit_inst_slot.slot_y) > 1
	and drop_off_inst == -1
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
	
	if deposit_inst != -1 
	{
		// Mine some resources
		if current_carry < max_carry 
			and deposit_inst.resource_type.base_resource_limit > 0 // Ensure the node still has resources
			and drop_off_inst == -1
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
		
		// Offload resources
		if (
			current_carry >= max_carry
			or deposit_inst.resource_type.base_resource_limit == 0
		)
			and drop_off_inst == -1
		{
			// Find the closest dropoff point
			drop_off_inst = instance_nearest(
				x,
				y,
				obj_par_drop_off
			);
		}
			
		if drop_off_inst != -1 {
			if point_distance(x, y, drop_off_inst.x, drop_off_inst.y) > 1
			{
			    move_towards_point(
					drop_off_inst.x,
					drop_off_inst.y,
					move_speed
				);
			}
			else {
				speed = 0;
				
				// Offload resources
				if current_carry > 0 {
					current_carry -= 1;
					
					increase_global_resource();
				}
				else {
					drop_off_inst = -1;
					
					if deposit_inst.resource_type.base_resource_limit == 0 {
						deposit_inst = -1;
						deposit_inst_slot = -1;
						return_home = true;
					}
				}
			}
		}
	}
}

if return_home {
	if point_distance(x, y, home_x, home_y) > 1 {
		move_towards_point(
			home_x,
			home_y,
			move_speed
		);
	}
	else {
		speed = 0;
		
		// Put into the available bots
		return_home = false;
		array_push(
			obj_resources_manager.available_mining_bots,
			self
		);
	}
}

