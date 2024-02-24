/// @description 

// Item Spr
item_spr = spr_dummy_8;
item_spr_w = sprite_get_width(item_spr);
item_spr_h = sprite_get_height(item_spr);


// Setup
hover_item_setup();

// Placements
is_placed = false;
can_be_placed = true;
placement_x = -1;
placement_y = -1;
hover_x = -1;
hover_y = -1;


// Set what type of material
resource_type = -1;
spawns_bot = false;


// Mining spots
minable_slots_available = num_mining_spots(item_spr_w, item_spr_h);
minable_row_size = item_spr_w / 32;
mineable_slots = -1;

