/// @description 



if is_placed {
	draw_self();
	
	if needs_to_be_constructed {
		draw_construction_sprite_and_decal();
	}
	else {
		resource_reduction();
	}
}
else {
	can_be_placed = can_be_placed_check();
	draw_placement_hover_indicator();
}


// Set the x,y of the minable slots
if is_placed
	and mineable_slots == -1
{
	set_minable_slots();
}
