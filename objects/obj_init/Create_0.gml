randomise();

global.pellet_sound = 0;
global.score = 0;
global.freeze_timer = 0;
global.ghost_combo = 0;
global.siren_instance = noone;
global.fright_time = 0;

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

audio_set_master_gain(0, 0);

alarm[0] = 30;