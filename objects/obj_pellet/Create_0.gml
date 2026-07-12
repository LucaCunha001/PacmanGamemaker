pellet_score = 10;
image_blend = #E8A484;
image_xscale = 2;
image_yscale = 2;
x--;
y--;

function play_pellet_sound()
{
    if (global.pellet_sound == 0)
    {
        audio_play_sound(snd_eat_dot_0, 1, false);
        global.pellet_sound = 1;
    }
    else
    {
        audio_play_sound(snd_eat_dot_1, 1, false);
        global.pellet_sound = 0;
    }
}