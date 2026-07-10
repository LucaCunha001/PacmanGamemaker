enum GameState
{
    PLAYING,
    LEVEL_COMPLETE,
    DYING,
    RESPAWN
}

enum Direction {
    LEFT,
    RIGHT,
    UP,
    DOWN
}

enum GhostMode
{
    CHASE,
    SCATTER,
    FRIGHTHEN,
    EATEN
}

enum GhostState
{
    IN_HOUSE,
    LEAVING_HOUSE,
    ENTERING_HOUSE,
    MOVING
}