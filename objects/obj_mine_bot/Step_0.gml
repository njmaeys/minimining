
// Set the sprite facing direction
target_direction();


// Set the sprite based on what it's doing
if currently_mining {
	sprite_index = spr_mining_bot_is_mining;
}
else {
	sprite_index = spr_mining_bot;
}



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
			currently_mining = true;
			
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
			currently_mining = false;
			
			// Find the closest dropoff point
			drop_off_inst = instance_nearest(
				x,
				y,
				obj_par_drop_off
			);
		}
			
		if drop_off_inst != -1 {
			var _drop_off_inst_x = drop_off_inst.x + 32;
			var _drop_off_inst_y = drop_off_inst.y + 32;
			
			if point_distance(x, y, _drop_off_inst_x, _drop_off_inst_y) > 1
			{	
			    move_towards_point(
					_drop_off_inst_x,
					_drop_off_inst_y,
					move_speed
				);
			}
			else {
				speed = 0;
				
				// Offload resources
				if current_carry > 0 {
					if current_drop_off_speed < drop_off_speed {
						current_drop_off_speed += 1;
					}
					else {
						current_carry -= 1;
						increase_global_resource();
						
						// Reset the drop off timer
						current_drop_off_speed = 0;
					}
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

if swap_resource_type {
	currently_mining = false;
			
	// Find the closest dropoff point
	if drop_off_inst == -1 {
		drop_off_inst = instance_nearest(
			x,
			y,
			obj_par_drop_off
		);
	}
	
	var _drop_off_inst_x = drop_off_inst.x + 32;
	var _drop_off_inst_y = drop_off_inst.y + 32;
			
	if point_distance(x, y, _drop_off_inst_x, _drop_off_inst_y) > 1
		and current_carry > 0
	{	
		move_towards_point(
			_drop_off_inst_x,
			_drop_off_inst_y,
			move_speed
		);
	}
	else {
		speed = 0;
				
		// Offload resources
		if current_carry > 0 {
			if current_drop_off_speed < drop_off_speed {
				current_drop_off_speed += 1;
			}
			else {
				current_carry -= 1;
				increase_global_resource();
						
				// Reset the drop off timer
				current_drop_off_speed = 0;
			}
		}
		else {
			// Reset the mining slot of the mining slot
			if deposit_inst != -1 {
				deposit_inst.mineable_slots[deposit_inst_slot.index].bot_inst = -1;
			}
			
			swap_resource_type = false;
			drop_off_inst = -1;
			deposit_inst = -1;
			deposit_inst_slot = -1;
			if point_distance(x, y, home_x, home_y) > 1 {
				return_home = true;
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

