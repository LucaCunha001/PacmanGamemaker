if (mode == GhostMode.FRIGHTHEN) {
	mode = GhostMode.EATEN;
	alarm[0] = 60;
    x = floor(x);
    y = floor(y);

    audio_play_sound(snd_eat_ghost, 1, false);

	global.ghost_combo++;
    global.freeze_timer = 60;
	var ghost_score = power(2, global.ghost_combo) * 100;
	
	var cx = x + sprite_width * 0.5;
	var cy = y + sprite_height * 0.5;
	
	instance_create_depth(
	    cx, cy,
	    -5,
	    obj_score_popup
	).value = ghost_score;

    global.score += ghost_score;
}

if (mode != GhostMode.FRIGHTHEN &&
    mode != GhostMode.EATEN &&
	global.game_state != GameState.DYING)
{
    global.game_state = GameState.DYING;
    global.death_timer = 60;
	instance_destroy(obj_ghost_generator);
	audio_stop_all();
}