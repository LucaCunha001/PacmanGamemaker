if (!visible) exit;

global.pellet_count++;
visible = false;
global.score += pellet_score;

play_pellet_sound();