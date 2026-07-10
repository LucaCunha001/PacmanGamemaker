global.score += score;

var score_popup = instance_create_depth(x + sprite_width/2, y + sprite_height/2, -5, obj_score_popup)
score_popup.value = score;
score_popup.alarm[0] *= 2;

audio_play_sound(snd_eat_fruit, 5, false);

instance_destroy();