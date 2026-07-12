draw_set_halign(fa_center);

switch (state)
{
    case TitleState.LOGO:
		draw_set_colour(c_white);
        draw_set_font(fnt_arcade);

        draw_text(room_width / 2, 24, "HIGH SCORE");
        draw_text(room_width / 2, 40, string(global.high_scores[0].score));

		var scale = 0.18;

		draw_sprite_ext(
		    spr_logo,
		    0,
		    room_width / 2,
		    70,
		    scale,
		    scale,
		    0,
		    c_white,
		    1
		);

        draw_text(room_width / 2, 150, "1 PLAYER");

        if (show_press)
        {
            draw_text(room_width / 2, 180, "PRESS ENTER");
        }

        draw_text(room_width / 2, 255, "© 2026 LUCA CUNHA");

        break;

    case TitleState.GHOSTS:
	    draw_set_halign(fa_center);
		draw_text(room_width / 2, 20, "CHARACTER / NICKNAME");

		draw_set_halign(fa_left);

		var text_x = room_width / 2 - 66;
		var sprite_x = text_x - 30;

		var ghosts = [
		    { color: #FF0000, text: "-SHADOW   \"BLINKY\"" },
		    { color: #FFB8FF, text: "-SPEEDY    \"PINKY\"" },
		    { color: #00FFFF, text: "-BASHFUL    \"INKY\"" },
		    { color: #FFB852, text: "-POKEY     \"CLYDE\"" }
		];

		for (var i = 0; i < array_length(ghosts); i++)
		{
		    var g = ghosts[i];
		    var y_ = 60 + i * 30;

		    draw_sprite_ext(spr_ghost_normal, 0, sprite_x, y_, 1, 1, 0, g.color, 1);

		    draw_sprite(spr_eyes, 1, sprite_x + 1, y_ + 1);

		    draw_set_colour(g.color);
		    draw_text(text_x, y_, g.text);
		}
	    draw_set_colour(c_white);

	break;

    case TitleState.DEMO:
        draw_text(room_width / 2, 12, "DEMONSTRATION");

        break;
}