randomise();
get_scores();

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

// audio_set_master_gain(0, 0);

room_goto_next();