if (level_end_timer > 0)
{
	if (level_end_timer <= 120)
	{
		var flash = ((120 - level_end_timer) div 12) mod 2;

		if (flash)
		    draw_sprite(spr_maze_white, 0, 0, 0);
		else
		    draw_sprite(spr_maze_blue, 0, 0, 0);
	}
	else
	{
		draw_sprite(spr_maze_blue, 0, 0, 0);
	}
}
else
{
	draw_sprite(spr_maze_blue, 0, 0, 0);
}

draw_set_colour(c_white);
draw_set_font(fnt_arcade);

draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_text(26, 0, "1up");
draw_text(73, 0, "high score");

draw_set_halign(fa_right);

var score_text = string(global.score);

if (global.score < 10)
	score_text = "0" + score_text;

draw_text(55, 9, score_text);

var high_score_text = string(global.high_score);
draw_text(135, 9, high_score_text);

var life_w = sprite_get_width(spr_small_pacman);

for (var i = 0; i < global.lives - 1; i++)
{
    draw_sprite(
        spr_small_pacman,
        0,
        45 - i * (life_w + 5),
        274
    );
}

var fruit_w = sprite_get_width(spr_fruits);

for (var i = max(global.level-5, 0); i < min(global.level, 5); i++)
{
    draw_sprite(
        spr_fruits,
        get_level_fruit(i+1)[$ "sprite"],
        206 - i * fruit_w, 274
    );
}

draw_set_colour(c_yellow);
draw_set_halign(fa_left);
if (audio_is_playing(snd_intromusic)) {
	draw_text(89, 160, "ready!");
}