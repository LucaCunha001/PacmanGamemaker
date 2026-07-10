if (!visible) exit;

global.pellet_count++;
visible = false;
global.score += score;

play_pellet_sound();