function generate_maze(_sprite)
{
    var w = sprite_get_width(_sprite);
    var h = sprite_get_height(_sprite);

    global.maze_w = w;
    global.maze_h = h;
    global.maze = array_create(h);

    var surf = surface_create(w, h);

    surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    draw_sprite(_sprite, 0, 0, 0);
    surface_reset_target();

    for (var my = 0; my < h; my++)
    {
        global.maze[my] = array_create(w);

        for (var mx = 0; mx < w; mx++)
        {
            var col = surface_getpixel(surf, mx, my);

            switch (col)
            {
                case c_black:
                    global.maze[my][mx] = 0;
                    break;

                case c_red:
                    global.maze[my][mx] = 2;
                    break;

                default:
                    global.maze[my][mx] = 1;
                    break;
            }
        }
    }

    surface_free(surf);
}

function maze_is_wall(px, py, is_ghost = true)
{
    var tx = floor(px / TILE_SIZE);
    var ty = floor((py - MAZE_OFFSET_Y) / TILE_SIZE);

    if (ty < 0 || ty >= global.maze_h)
        return true;

    if (tx < 0)
        tx = global.maze_w - 1;

    if (tx >= global.maze_w)
        tx = 0;

    switch (global.maze[ty][tx])
    {
        case 0:
            return false;

        case 1:
            return true;

        case 2:
			if (is_ghost) {
				if (state == GhostState.LEAVING_HOUSE || mode == GhostMode.EATEN) return false;
			}
            return true;
    }

    return true;
}