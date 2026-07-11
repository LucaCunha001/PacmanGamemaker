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

        draw_text(room_width / 2, 20, "CHARACTER / NICKNAME");

        draw_set_colour(c_red);
        draw_text(room_width / 2, 60, "SHADOW   BLINKY");

        draw_set_colour(#ffb8ff);
        draw_text(room_width / 2, 90, "SPEEDY    PINKY");

        draw_set_colour(c_aqua);
        draw_text(room_width / 2, 120, "BASHFUL    INKY");

        draw_set_colour(c_orange);
        draw_text(room_width / 2, 150, "POKEY     CLYDE");

        draw_set_colour(c_white);

        break;

    case TitleState.DEMO:

        draw_text(room_width / 2, 12, "DEMONSTRATION");

        break;
}