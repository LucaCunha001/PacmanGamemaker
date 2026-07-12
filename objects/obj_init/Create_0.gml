randomise();
get_scores();

display_set_gui_size(camera_get_view_width(view_camera[0]),
                     camera_get_view_height(view_camera[0]));

global.mode_table =
[
    { mode: GhostMode.SCATTER, frames: 420 },
    { mode: GhostMode.CHASE,   frames: 1200 },

    { mode: GhostMode.SCATTER, frames: 420 },
    { mode: GhostMode.CHASE,   frames: 1200 },

    { mode: GhostMode.SCATTER, frames: 300 },
    { mode: GhostMode.CHASE,   frames: 1200 },

    { mode: GhostMode.SCATTER, frames: 300 },
    { mode: GhostMode.CHASE,   frames: -1 }
];

global.fright_times = [
    6, 5, 4, 3,
    2, 5, 2, 2,
    1, 5, 2, 1,
    1, 3, 1, 1,
    1, 1, 1
];

global.fright_flashes = [
    5, 5, 5, 5,
    5, 5, 5, 5,
    3, 5, 5, 3,
    3, 5, 3, 3,
    3, 3, 3
];

// audio_set_master_gain(0, 0);

room_goto_next();