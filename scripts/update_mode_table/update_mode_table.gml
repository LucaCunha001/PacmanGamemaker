function update_mode_table()
{
	var rm_speed = game_get_speed(gamespeed_fps);
    var scatter_time;
    
    if (global.level == 1)
        scatter_time = 7;
    else
        scatter_time = 5;


    global.mode_table =
    [
        { mode: GhostMode.SCATTER, frames: scatter_time * rm_speed },
        { mode: GhostMode.CHASE,   frames: 20 * rm_speed },

        { mode: GhostMode.SCATTER, frames: scatter_time * rm_speed },
        { mode: GhostMode.CHASE,   frames: 20 * rm_speed },

        { mode: GhostMode.SCATTER, frames: scatter_time * rm_speed },
        { mode: GhostMode.CHASE,   frames: 20 * rm_speed },

        { mode: GhostMode.SCATTER, frames: 5 * rm_speed },
        { mode: GhostMode.CHASE,   frames: -1 }
    ];
}