if (global.game_state != GameState.PLAYING) exit;

any_fright = false;
any_eye = false;

with (obj_ghost)
{
    switch (mode)
    {
        case GhostMode.EATEN:
			if (alarm[0] <= 0) other.any_eye = true;
            break;

        case GhostMode.FRIGHTHEN:
            other.any_fright = true;
            break;
    }

    if (other.any_eye && other.any_fright)
        break;
}

if (any_eye)
{
    if (!audio_is_playing(snd_eyes))
    {
        audio_stop_sound(snd_fright);
		audio_stop_sound(global.siren_instance);
        audio_play_sound(snd_eyes, 2, true);
    }
}
else if (any_fright)
{
    audio_stop_sound(snd_eyes);
	audio_stop_sound(global.siren_instance);

    if (!audio_is_playing(snd_fright))
        audio_play_sound(snd_fright, 2, true);
}
else if (obj_maze_creator.initialized) {
    audio_stop_sound(snd_eyes);
    audio_stop_sound(snd_fright);
	
	var siren;
	var remaining = global.pellet_total - global.pellet_count;

    if (remaining >= 109)
	    siren = snd_siren_0;
	else if (remaining >= 45)
	    siren = snd_siren_1;
	else if (remaining >= 13)
	    siren = snd_siren_2;
	else if (remaining >= 1)
	    siren = snd_siren_3;
	else
	    siren = snd_siren_4;

    if (!audio_is_playing(siren))
    {
		if (audio_is_playing(global.siren_instance)) audio_stop_sound(global.siren_instance);
		
		global.siren_instance = audio_play_sound(siren, 20, true);
	}
}