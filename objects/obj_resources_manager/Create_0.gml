/// @description 

// Responsible for managing global resource settings


// Power levels
min_power = 5; // Ensure power is never completely gone. I'm thinking a little mouse on a wheel running situation


// Track available bots
available_mining_bots = [];
available_carry_bots = [];


// Mining resource types
mining_resource_types = {
	coal_small: {
		resource_name: "coal_small",
		mining_speed: 60,
		resource_placement_spr: "",
		resource_drop_spr: "",
		base_resource_limit: 25,
		construction_time: 60 * 5, // TODO: Play around with construction and demo times
		demolition_time: 60 * 2,
	},
	coal_medium: {
		resource_name: "coal_medium",
		mining_speed: 60,
		resource_placement_spr: "",
		resource_drop_spr: "",
		base_resource_limit: 50,
		construction_time: 60 * 5,
		demolition_time: 60 * 2,
	},
	coal_large: {
		resource_name: "coal_large",
		mining_speed: 60,
		resource_placement_spr: "",
		resource_drop_spr: "",
		base_resource_limit: 100,
		construction_time: 60 * 5,
		demolition_time: 60 * 2,
	},
	copper_ore_small: {
		resource_name: "copper_ore_small",
		mining_speed: 120,
		resource_placement_spr: "",
		resource_drop_spr: "",
		base_resource_limit: 100,
		construction_time: 60 * 5,
		demolition_time: 60 * 2,
	},
	iron_ore_small: {
		resource_name: "iron_ore_small",
		mining_speed: 120,
		resource_placement_spr: "",
		resource_drop_spr: "",
		base_resource_limit: 100,
		construction_time: 60 * 5,
		demolition_time: 60 * 2,
	},
}



// Smelting recipes
base_cook_time = 60;
smelting_recipes = {
	copper_bar: {
		coal: 5,
		copper_ore: 10,
		cook_time: base_cook_time * 30,
	}
}


