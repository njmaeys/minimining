/// @description 


// Go construct the thing
if item_to_construct != -1
	and item_to_construct.needs_to_be_constructed
{
	image_alpha = 1;
	
	var _construct_x = item_to_construct.x + (item_to_construct.item_spr_w / 2)
	var _construct_y = item_to_construct.y + (item_to_construct.item_spr_h / 2)
	
	if point_distance(x, y, _construct_x, _construct_y) > 1 {
	    move_towards_point(
			_construct_x,
			_construct_y,
			move_speed
		);
	}
	else {
		speed = 0;
		
		if item_to_construct.current_construction_time < item_to_construct.resource_type.construction_time {
			item_to_construct.current_construction_time += 1;
		}
		else {
			item_to_construct.needs_to_be_constructed = false;
			item_to_construct = -1;
		}
	}
}


// Go home
if item_to_construct == -1 {
	if point_distance(x, y, home_x, home_y) > 1 {
		move_towards_point(
			home_x,
			home_y,
			move_speed
		);
	}
	else {
		speed = 0;
		image_alpha = 0;
		
		// Make the bot available to construct again
		array_push(
			obj_resources_manager.available_construction_bots,
			self
		);
	}
}







