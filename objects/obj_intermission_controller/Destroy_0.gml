if (room == room_intermission) room_goto(room_title);

global.level++;
global.game_state = GameState.PLAYING;
recreate_pellets();
restart_level();