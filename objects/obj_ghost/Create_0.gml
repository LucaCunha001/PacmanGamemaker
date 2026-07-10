name = "";
looking_at = 0;
image_speed = 0;
state = GhostState.IN_HOUSE;
mode = global.current_mode;
house_timer = 0;
current_timer = 0;

target_x = x;
target_y = y;

house_exit_cx = 112;
house_exit_cy = 116;

scatter_x = 0;
scatter_y = 0;

flash_timer = 0;
flash_interval = 15;
flash_count = 10;

spd = 1;
fright_spd = 0.5;
eaten_spd = 4;
current_speed = spd;

initialized = false;

ghost_move = function(center_x, center_y, tile_x, tile_y, cx, cy) {
	x = center_x - sprite_width * 0.5;
	y = center_y - sprite_height * 0.5;
	
	switch (mode)
	{
		case GhostMode.SCATTER:
		    choose_direction(tile_x, tile_y, scatter_x, scatter_y);
		    break;

		case GhostMode.CHASE:
		    choose_direction(tile_x, tile_y, target_x, target_y);
		    break;

		case GhostMode.EATEN:
			if (abs(cx - house_exit_cx) <= eaten_spd &&
				abs(cy - house_exit_cy) <= eaten_spd)
			{
				x = house_exit_cx - sprite_width * 0.5;
				y = house_exit_cy - sprite_height * 0.5;

				state = GhostState.ENTERING_HOUSE;
				exit;
			}
			
		    choose_direction(tile_x, tile_y, house_exit_cx, house_exit_cy);
		    break;

		case GhostMode.FRIGHTHEN:
		    var possible = [];

		    var dirs =
		    [
		        Direction.UP,
		        Direction.LEFT,
		        Direction.DOWN,
		        Direction.RIGHT
		    ];

		    for (var i = 0; i < 4; i++)
		    {
		        var dir = dirs[i];

		        if (dir == opposite_dir(looking_at))
		            continue;

		        var px = (tile_x + dir_x(dir)) * TILE_SIZE + TILE_CENTER;
		        var py = (tile_y + dir_y(dir)) * TILE_SIZE + MAZE_OFFSET_Y + TILE_CENTER;

		        if (!maze_is_wall(px, py, true))
		            array_push(possible, dir);
		    }

		    if (array_length(possible) > 0)
		        looking_at = possible[irandom(array_length(possible)-1)];

		    break;
	}
}