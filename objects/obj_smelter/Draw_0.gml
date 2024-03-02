/// @description 



if is_placed {
	draw_self();
}
else {
	can_be_placed = can_be_placed_check();
	draw_placement_hover_indicator();
}


draw_text(
	x,
	y,
	current_resources.coal
);
draw_text(
	x,
	y + 16,
	current_resources.copper_ore
);


