/// @description 

depth = obj_game_manager.depths.meunus;

// Mouse
mouse_hovering_toggle = false;


// Sizes
closed_width = 16;
open_width = 160;
height = 304;


// Offsets for where to display the actual resource info
x_offset = 400;
y_offset = 152;


// Metadata
is_open = false;


// Menus to choose from
active_menu_slot = -1;
menus = [
	{
		m_name: "bots",
		m_srp: spr_menu_tab_bots,
	},
	{
		m_name: "resources",
		m_srp: spr_menu_tab_resources,
	},
	{
		m_name: "buildings",
		m_srp: spr_menu_tab_buildings,
	},
	{
		m_name: "settings",
		m_srp: spr_menu_tab_settings,
	}
]


