/// @description 


y = room_height / 2;


if mouse_check_button_pressed(mb_middle) {
	drag_start_x = mouse_x;
}

if mouse_check_button(mb_middle) {
	// If the player is holding right click and moves

	// Move camera right
	if drag_start_x > mouse_x {
		if x >= room_width - 400 {
			return;
		}
		x += 6;
	}
	
	// Move camera left
	if drag_start_x < mouse_x {
		if x <= 400 {
			return;
		}
		x -= 6;
	}
}
