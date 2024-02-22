function depth_sort(){
	// Depth sort
	depth =- y;
}


function move_game_window() {
	if mouse_check_button_pressed(mb_right)
	{
		mx = window_mouse_get_x();
		my = window_mouse_get_y();
	}

	if mouse_check_button(mb_right)
	{
		posx -= mx - window_mouse_get_x();
		posy -= my - window_mouse_get_y();
		
		window_set_position(window_get_x()+posx, window_get_y()+posy);
		
		mx = window_mouse_get_x();
		my = window_mouse_get_y();
	}
}