x = 0;
y = 0;

timer = 0;

generate_maze(spr_maze_base);
instance_create_depth(0, 0, 0, obj_game_controller);

musicinstance = audio_play_sound(snd_intromusic, 20, false);

global.level = 1;
global.spawned_fruit_1 = false;
global.spawned_fruit_2 = false;
global.mode_timer = 0;
global.mode_index = 0;
recreate_pellets();

depth = 0;

pacman = instance_create_depth(106, 205, depth - 1, obj_pacman);

initialized = false;