draw_set_font(fnt_arcade);
draw_set_halign(fa_left);
draw_set_colour(c_white);

draw_text(72, 16, "HIGH SCORES");

draw_text(20, 40, "RANK");
draw_text(70, 40, "SCORE");
draw_text(150, 40, "NAME");

var suffix =
[
    "1ST","2ND","3RD","4TH","5TH",
    "6TH","7TH","8TH","9TH","10TH"
];

for (var i = 0; i < array_length(global.high_scores); i++) {
	var entry = global.high_scores[i];
	
	var name = entry.name;
	
	if (i == global.new_high_score_index)
	{
	    draw_set_colour(c_yellow);
		name = current_name + "_";
	}
	else
	{
	    draw_set_colour(c_white);
	}

    var y_ = 64 + i * 18;

    draw_text(20, y_, suffix[i]);
    draw_text(70, y_, string(entry.score));
    draw_text(150, y_, name);
}

if (blink)
{
    draw_set_halign(fa_center);
    draw_text(room_width / 2, 270, "PRESS ENTER");
}