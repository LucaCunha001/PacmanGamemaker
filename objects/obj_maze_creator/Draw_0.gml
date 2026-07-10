if (!variable_global_exists("maze")) exit;

exit;

draw_set_alpha(0.35);

for (var my = 0; my < global.maze_h; my++)
{
    for (var mx = 0; mx < global.maze_w; mx++)
    {
        var px = mx * TILE_SIZE;
        var py = MAZE_OFFSET_Y + my * TILE_SIZE;

        switch (global.maze[my][mx])
        {
            case 0:
                draw_set_color(c_lime);
                break;

            case 1:
                draw_set_color(c_red);
                break;

            case 2:
                draw_set_color(c_aqua);
                break;
        }

        draw_rectangle(
            px,
            py,
            px + TILE_SIZE,
            py + TILE_SIZE,
            false
        );
		
		draw_set_color(c_yellow);
        var cx = mx * TILE_SIZE + TILE_CENTER;
        var cy = MAZE_OFFSET_Y + my * TILE_SIZE + TILE_CENTER;

        draw_circle(cx, cy, 1, false);
    }
}

draw_set_alpha(1);