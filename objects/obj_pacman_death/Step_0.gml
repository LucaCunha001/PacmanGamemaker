if (image_index == 0 && timer > 0) {
	visible = false;
}

timer++;

if (timer == 60) {
	audio_stop_sound(death_0);
}

if (timer > 60 && !audio_is_playing(snd_death_1) && death_1_count < 2) {
	audio_play_sound(snd_death_1, 20, false);
	death_1_count++;
}

if (timer > 180 &&
	!audio_is_playing(snd_death_1) &&
	global.game_state != GameState.RESPAWN) {
	global.game_state = GameState.RESPAWN;
	restart_level();
}