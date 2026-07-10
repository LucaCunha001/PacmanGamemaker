with (obj_pacman)
	initialized = true;
with (obj_ghost) {
	initialized = true;
	image_speed = 0.1;
}
global.game_state = GameState.PLAYING;

instance_destroy();