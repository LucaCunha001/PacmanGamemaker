if (!initialized) {
	timer++;
	
	if (timer == 120) {
		global.lives--;
		instance_create_depth(0, 0, 0, obj_ghost_generator);
		pacman = instance_create_depth(106, 205, depth - 1, obj_pacman);
	}
	
	if (!audio_is_playing(musicinstance)) {
		initialized = true;
		pacman.initialized = true;
		with (obj_ghost) {
			initialized = true;
			image_speed = 0.1;
		}
		global.game_state = GameState.PLAYING;
	}
}

if (keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(!window_get_fullscreen());
}