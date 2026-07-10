function restart_level() {
	instance_destroy(obj_ghost_generator);
	instance_destroy(obj_fruit);
	
	instance_create_depth(106, 205, -1, obj_pacman);
	instance_create_depth(0, 0, 0, obj_ghost_generator);
	global.game_state = GameState.RESPAWN;
	
	global.spawned_fruit_1 = false;
	global.spawned_fruit_2 = false;
	global.mode_timer = 0;
	global.mode_index = 0;
	global.current_mode = GhostMode.SCATTER;
	
	alarm[0] = 120;
}