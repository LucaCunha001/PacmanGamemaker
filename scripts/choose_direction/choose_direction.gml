function choose_direction(tile_x, tile_y, target_x, target_y)
{
    var dirs =
    [
        Direction.UP,
        Direction.LEFT,
        Direction.DOWN,
        Direction.RIGHT
    ];

    var best_dir = looking_at;
    var best_dist = 1_000_000;

    for (var i = 0; i < 4; i++)
    {
        var dir = dirs[i];

        if (dir == opposite_dir(looking_at))
            continue;

        var next_tile_x = tile_x + dir_x(dir);
        var next_tile_y = tile_y + dir_y(dir);

        var px = next_tile_x * TILE_SIZE + TILE_CENTER;
        var py = next_tile_y * TILE_SIZE + MAZE_OFFSET_Y + TILE_CENTER;

        if (!can_turn(
		    tile_x * TILE_SIZE + TILE_CENTER,
		    tile_y * TILE_SIZE + MAZE_OFFSET_Y + TILE_CENTER,
		    dir,
		    true
		)) {
		    continue;
		}

        var dx = target_x - px;
        var dy = target_y - py;

        var dist = dx * dx + dy * dy;

        if (dist < best_dist)
        {
            best_dist = dist;
            best_dir = dir;
        }
    }

    looking_at = best_dir;
}