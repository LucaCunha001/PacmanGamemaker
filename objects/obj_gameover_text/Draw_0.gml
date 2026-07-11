timer--;

if (timer <= 0)
{
    var index = get_high_score_index(global.score);

	if (index != -1)
	{
	    global.new_high_score_index = index;

	    array_insert(
	        global.high_scores,
	        index,
	        {
	            name: "",
	            score: global.score
	        }
	    );

	    array_resize(global.high_scores, 10);

	    save_scores();

	    room_goto(room_high_scores);
	}
	else
	{
	    room_goto(room_title);
	}
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_red)
draw_text(x, y, "GAME  OVER");