/// @description





// Draw what it is carrying
if currently_carrying != -1 
	and current_carry_amount > 0
{
	switch currently_carrying {
		case "coal":
			draw_sprite(
				spr_coal_icon,
				0,
				x,
				y
			);
		break;
		
		case "copper_ore":
			draw_sprite(
				spr_copper_icon,
				0,
				x,
				y
			);
		break;
	}
}



draw_self();

