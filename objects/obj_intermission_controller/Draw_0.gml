draw_set_colour(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

switch(state)
{
    case IntermissionState.START:
        timer++;

        if(timer >= game_get_speed(gamespeed_fps))
        {
            state = IntermissionState.PLAYING;
            timer = 0;
			audio_play_sound(snd_intermission, 20, true);
        }
		break;

    case IntermissionState.PLAYING:
		switch(act)
        {
            case 1:
                act1();
            break;


            case 2:
                act2();
            break;


            case 3:
                act3();
            break;
        }
		timer++;

    break;


    case IntermissionState.END:

        timer++;

        if(timer >= game_get_speed(gamespeed_fps) * 2)
        {
			instance_destroy();
        }
		audio_stop_sound(snd_intermission);

    break;
}