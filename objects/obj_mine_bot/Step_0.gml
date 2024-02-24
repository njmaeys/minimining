/// @description 



// TODO: Move to func
// Find the nearest deposit that has an open slot and go to it
if deposit_inst == -1 {
	// If the nearest is already occumpied move on to the next
	var _attempted = [];
	
	//deposit_inst = instance_nearest(
	//	x,
	//	y,
	//	obj_par_deposit
	//);
	
	//show_debug_message($"Deposit inst: {deposit_inst}");
	//show_debug_message($"Deposit inst list: {deposit_inst.minable_slots_available}");

	/*
	TODO: This is janky as fuck... see what I can do about it to get this working
	*/
	var pointx,pointy,object,n,list,nearest;
	pointx = x;
	pointy = y;
	object = obj_par_deposit;
	
	n = 1;
	n = min(n, instance_number(object));
	
	list = ds_priority_create();
	nearest = noone;
	
	with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
	repeat (n) nearest = ds_priority_delete_min(list);
	ds_priority_destroy(list);
	//return nearest;
	
	deposit_inst = nearest;
	var _slot_open = false;
	for (var _i = 0; _i < deposit_inst.minable_slots_available; _i += 1) {
		var _item = deposit_inst.mineable_slots[_i];
		
		if _item.bot_inst == -1 {
			_item.bot_inst = self;

			deposit_inst_slot = _item;
			_slot_open = true;
			// After finding the slot to use then break out of the for loop
			break;
		}
	}
	
	if not _slot_open {
		deposit_inst = -1;
	}
}

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
	speed = 0; 
}





