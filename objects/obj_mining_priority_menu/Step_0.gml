/// @description 


mouse_hovering = mouse_hovering_location(
	menu_x,
	y,
	menu_x + 97,
	y + 40
);


// Delete the instance if anywhere is clicked besides it
if mouse_check_button_pressed(mb_left) 
	and mouse_hovering == 0
{
	my_home_inst.draw_line_to_bot = false;
	instance_destroy();
}





