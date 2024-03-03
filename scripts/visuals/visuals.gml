function target_direction() {
	// If x > prev x it's moving right
	if x > prev_x {
		image_xscale = -1;
	}
	else {
		image_xscale = 1;
	}
	
	prev_x = x;
}


