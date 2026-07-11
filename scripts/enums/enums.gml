enum TitleState
{
    LOGO,
    GHOSTS,
    DEMO
}

enum GameState
{
    PLAYING,
    LEVEL_COMPLETE,
    DYING,
    RESPAWN,
    GAME_OVER
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