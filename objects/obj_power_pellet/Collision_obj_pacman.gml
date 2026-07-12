global.pellet_count++;
global.ghost_combo = 0;
global.score += score;

var index = min(global.level - 1, array_length(global.fright_times) - 1);
global.fright_time = global.fright_times[index] * game_get_speed(gamespeed_fps);

with (obj_ghost) {
	if (mode != GhostMode.EATEN) {
		mode = GhostMode.FRIGHTHEN;
        flash_count = global.fright_flashes[index];
		x = round(x);
		y = round(y);
	}
	looking_at = opposite_dir(looking_at);
	flash_count = global.fright_flashes[index];
}

instance_destroy();