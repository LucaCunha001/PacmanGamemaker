function dir_x(dir)
{
    switch (dir)
    {
        case Direction.LEFT:  return -1;
        case Direction.RIGHT: return 1;
    }

    return 0;
}

function dir_y(dir)
{
    switch (dir)
    {
        case Direction.UP:   return -1;
        case Direction.DOWN: return 1;
    }

    return 0;
}

function opposite_dir(dir)
{
    switch (dir)
    {
        case Direction.LEFT:  return Direction.RIGHT;
        case Direction.RIGHT: return Direction.LEFT;
        case Direction.UP:    return Direction.DOWN;
        case Direction.DOWN:  return Direction.UP;
    }

    return -1;
}

function can_walk(cx, cy, is_ghost = true)
{
    var r = is_ghost ? GHOST_RADIUS : PACMAN_RADIUS;

    return
        !maze_is_wall(cx-r, cy-r, is_ghost) &&
        !maze_is_wall(cx+r, cy-r, is_ghost) &&
        !maze_is_wall(cx-r, cy+r, is_ghost) &&
        !maze_is_wall(cx+r, cy+r, is_ghost);
}

function can_turn(cx, cy, dir, is_ghost = true)
{
    var probe = TILE_CENTER;

    return can_walk(
        cx + dir_x(dir) * probe,
        cy + dir_y(dir) * probe,
        is_ghost
    );
}