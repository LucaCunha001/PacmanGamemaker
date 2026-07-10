if (alarm[0] > 0 && mode == GhostMode.EATEN) exit;

if (mode == GhostMode.FRIGHTHEN)
{
    var spr = spr_ghost_fright;

	if (flash_timer > 0)
	{
	    if ((flash_timer div flash_interval) mod 2 == 1)
	        spr = spr_ghost_fright_alert;
	}

	draw_sprite(spr, image_index, x, y);
}
else
{
    if (mode != GhostMode.EATEN)
        draw_self();

    draw_sprite(spr_eyes, looking_at, x + 1, y + 1);
}

draw_set_colour(image_blend);
switch (mode) {
	case GhostMode.CHASE:
		draw_point(target_x, target_y);
		break;
	case GhostMode.EATEN:
		draw_point(house_exit_cx, house_exit_cy);
		break;
}
draw_set_colour(c_white);