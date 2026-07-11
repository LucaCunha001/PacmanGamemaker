x = 0;
y = 0;

instance_create_depth(0, 0, 0, obj_gravador);

global.pellet_sound = 0;
global.score = 0;
global.freeze_timer = 0;
global.ghost_combo = 0;
global.siren_instance = noone;
global.fright_time = 0;
global.level = 1;
global.spawned_fruit_1 = false;
global.spawned_fruit_2 = false;
global.mode_timer = 0;
global.mode_index = -1;
global.game_state = GameState.RESPAWN;
global.lives = 4;
global.extra_life_given = false;

timer = 0;

generate_maze(spr_maze_base);
instance_create_depth(0, 0, 0, obj_game_controller);

musicinstance = audio_play_sound(snd_intromusic, 20, false);

recreate_pellets();

depth = 0;

initialized = false;