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
		data: [
			{
				d_title: "Mining Bot",
				bot_obj: obj_mine_bot_placement,
			}
		],
	},
	{
		m_name: "resources",
		m_srp: spr_menu_tab_resources,
		data: [
			{
				d_title: "Coal Small",
				resource_type: obj_resources_manager.mining_resource_types.coal_small,
				resource_spr: spr_coal_patch_small,
				resource_obj: obj_ore_deposit_small,
			},
			{
				d_title: "Coal Medium",
				resource_type: obj_resources_manager.mining_resource_types.coal_medium,
				resource_spr: spr_coal_patch_medium,
				resource_obj: obj_ore_deposit_medium,
			},
			{
				d_title: "Coal Large",
				resource_type: obj_resources_manager.mining_resource_types.coal_large,
				resource_spr: spr_coal_patch_large,
				resource_obj: obj_ore_deposit_large,
			},
			{
				d_title: "Copper Small",
				resource_type: obj_resources_manager.mining_resource_types.copper_ore_small,
				resource_spr: spr_copper_patch_small,
				resource_obj: obj_ore_deposit_small,
			},
		],
	},
	{
		m_name: "buildings",
		m_srp: spr_menu_tab_buildings,
		data: [
			{
				d_title: "Smelter",
				building_obj: obj_smelter,
			},
		],
	},
	{
		m_name: "settings",
		m_srp: spr_menu_tab_settings,
		data: [
			{
				d_title: "Todo",
			},
		],
	}
]


