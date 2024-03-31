function resource_has_been_researched(_resource_name) {
	switch _resource_name {
		case "coal":
			return obj_game_manager.progressions.coal.unlocked;
		
		case "copper":
			return obj_game_manager.progressions.copper_ore.unlocked;
	}
}