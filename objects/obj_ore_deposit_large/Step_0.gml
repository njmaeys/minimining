
if not is_placed {
	place_item_on_map();
}


if mineable_slots != -1 {
	if needs_to_be_constructed {
		find_construction_bot();
	}
	else {
		ore_deposit_find_bot();
	}
}


if resource_type.base_resource_limit == 0 {
	image_index = 1;
}