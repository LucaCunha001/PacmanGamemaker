if (keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(!window_get_fullscreen());
}

blink_timer++;

if (blink_timer >= 30)
{
    blink_timer = 0;
    show_press = !show_press;
}

timer++;

switch (state)
{
    case TitleState.LOGO:

        if (keyboard_check_pressed(vk_enter))
        {
            room_goto(room_game);
            exit;
        }

        if (timer >= logo_time)
        {
            state = TitleState.GHOSTS;
            timer = 0;
        }

        break;

    case TitleState.GHOSTS:

        if (keyboard_check_pressed(vk_enter))
        {
            room_goto(room_game);
            exit;
        }

        if (timer >= ghosts_time)
        {
            state = TitleState.DEMO;
            timer = 0;

            // TODO:
            // iniciar demonstração
        }

        break;

    case TitleState.DEMO:

        if (keyboard_check_pressed(vk_enter))
        {
            room_goto(room_game);
            exit;
        }

        if (timer >= demo_time)
        {
            state = TitleState.LOGO;
            timer = 0;
        }

        break;
}