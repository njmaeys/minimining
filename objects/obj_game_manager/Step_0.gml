/// @description 


if mouse_has_item
	and mouse_check_button_pressed(mb_right) 
{
	remove_item_from_mouse();
}


// Allows user to move around the borderless window
move_game_window();

