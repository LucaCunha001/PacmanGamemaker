if (global.freeze_timer <= 0) {
	if (global.fright_time > 0) global.fright_time--;

	if (global.fright_time == 120) {
		with (obj_ghost) {
			flash_timer = flash_count * flash_interval;
		}
	}

	if (global.fright_time == 0)
	{
	    with (obj_ghost)
	    {
	        if (mode == GhostMode.FRIGHTHEN)
	        {
	            mode = global.current_mode;
	            looking_at = opposite_dir(looking_at);
	        }
	    }
	}
	
	if (!global.spawned_fruit_1 && global.pellet_count == 70)
	{
	    spawn_fruit();
	    global.spawned_fruit_1 = true;
	}

	if (!global.spawned_fruit_2 && global.pellet_count == 170)
	{
	    spawn_fruit();
	    global.spawned_fruit_2 = true;
	}
} else {
	global.freeze_timer--;
}

switch (global.game_state)
{
    case GameState.LEVEL_COMPLETE:
        level_end_timer--;

		if (level_end_timer == 144) {
			with (obj_ghost) {
				instance_destroy();
			}
		}

        if (level_end_timer <= 0) {
			instance_destroy(obj_pacman);
			
		    if (global.level == 2 || global.level == 5 || global.level == 9)
		    {
		        global.state = GameState.INTERMISSION;
		        instance_create_depth(0, 0, -6, obj_intermission_controller);
		    }
		    else
		    {
		        restart_level();
				recreate_pellets();
		    }
        }

        break;
	
	case GameState.PLAYING:
		global.high_score = max(global.score, global.high_score);
		
		if (global.pellet_count >= global.pellet_total) {
		    global.game_state = GameState.LEVEL_COMPLETE;
		    level_end_timer = 240;
			audio_stop_all();
		}
		
		if (global.mode_timer > 0)
		{
		    global.mode_timer--;
		}

		if (global.mode_timer == 0)
		{
		    global.mode_index++;

		    var entry = global.mode_table[global.mode_index];

		    global.current_mode = entry.mode;
		    global.mode_timer = entry.frames;

		    with (obj_ghost)
		    {
		        if (state == GhostState.MOVING &&
		            mode != GhostMode.EATEN &&
		            mode != GhostMode.FRIGHTHEN)
		        {
		            mode = global.current_mode;
		            looking_at = opposite_dir(looking_at);
		        }
		    }
		}
		
		if (!global.extra_life_given && global.score >= 10_000) {
			global.extra_life_given = true;
			global.lives++;

			audio_play_sound(snd_extend, 10, false);
		}
		
		break;
	
	case GameState.DYING:
		if (global.death_timer == 0) {
			with (obj_ghost)
			    instance_destroy();

			obj_pacman.start_death_animation();
		}
		if (global.death_timer >= 0) global.death_timer--;
		break;
}