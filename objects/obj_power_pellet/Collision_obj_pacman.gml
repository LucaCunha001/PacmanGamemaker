global.pellet_count++;
global.ghost_combo = 0;
global.score += score;

global.fright_time = 360;

with (obj_ghost) {
	if (mode != GhostMode.EATEN) mode = GhostMode.FRIGHTHEN;
	looking_at = opposite_dir(looking_at);
}

instance_destroy();