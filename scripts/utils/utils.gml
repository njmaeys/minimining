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


function copy_struct(_struct){
    var _key, _value;
    var _new_copy = {};
    var _keys = variable_struct_get_names(_struct);
    for (var _i = array_length(_keys)-1; _i >= 0; --_i) {
            _key = _keys[_i];
            _value = _struct[$ _key];
            variable_struct_get(_struct, _key);
            variable_struct_set(_new_copy, _key, _value)
    }
    return _new_copy;
}

function draw_construction_sprite_and_decal(_size) {
	var _construction_spr = spr_small_resource_construction;
	
	switch _size {
		case "small":
			_construction_spr = spr_small_resource_construction;
		break;
		
		case "medium":
			_construction_spr = spr_medium_resource_construction;
		break;
		
		case "large":
			_construction_spr = spr_large_resource_construction;
		break;
	}
	
	draw_sprite(
		_construction_spr,
		0,
		x,
		y
	);
}

function draw_resource_depleted(_size) {
	var _depleted_spr = spr_small_resource_construction;
	
	switch _size {
		case "small":
			_depleted_spr = spr_small_resource_depleted;
		break;
		
		case "medium":
			_depleted_spr = spr_medium_resource_depleted;
		break;
		
		case "large":
			_depleted_spr = spr_large_resource_depleted;
		break;
	}
	
	draw_sprite(
		_depleted_spr,
		0,
		x,
		y
	);
}