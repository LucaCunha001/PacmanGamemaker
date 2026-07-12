if (global.freeze_timer > 0 && mode != GhostMode.EATEN) {
	image_speed = 0;
    exit;
}

if (global.game_state != GameState.PLAYING)
    exit;

if (!initialized) exit;
if (alarm[0] > 0 && mode == GhostMode.EATEN) exit;

if (flash_timer > 0)
{
    flash_timer--;
}

if (name == "Blinky" &&
    mode != GhostMode.EATEN &&
    mode != GhostMode.FRIGHTHEN)
{
    var lvl = get_level_data();

    var elroy_stage = 0;

    if (global.pellet_count >= 244 - lvl[7])
        elroy_stage = 2;
    else if (global.pellet_count >= 244 - lvl[5])
        elroy_stage = 1;


    if (elroy_stage > 0)
    {
        current_speed = get_level_speed(
            elroy_stage == 1 ? "elroy1" : "elroy2"
        );

        mode = GhostMode.CHASE;
    }
}

image_speed = 0.2;

if (mode == GhostMode.EATEN) {
	x = floor(x);
	y = floor(y);
}

var cx = (current_speed != spd ? x : round(x)) + sprite_width * 0.5;
var cy = (current_speed != spd ? y : round(y)) + sprite_height * 0.5;

var tile_x = floor(cx / TILE_SIZE);
var tile_y = floor((cy - MAZE_OFFSET_Y) / TILE_SIZE);

var center_x = tile_x * TILE_SIZE + TILE_CENTER;
var center_y = tile_y * TILE_SIZE + MAZE_OFFSET_Y + TILE_CENTER;

var margem = 1;
if (mode == GhostMode.EATEN) margem = 4;

current_speed = mode == GhostMode.FRIGHTHEN ? fright_spd : spd;
if ((x <= 43 || x >= 180) &&
	(y == 133)) {
	current_speed = tunel_spd;
}
if (mode == GhostMode.EATEN) {
	current_speed = eaten_spd;
}

var on_node =
(
    abs(cx - center_x) < current_speed &&
    abs(cy - center_y) < current_speed
);

var pac_cx = obj_pacman.x + obj_pacman.sprite_width / 2;
var pac_cy = obj_pacman.y + obj_pacman.sprite_height / 2;

switch (name) {
	case "Blinky":
		target_x = pac_cx;
		target_y = pac_cy;
		break;
	
	case "Pinky":
		var px = dir_x(obj_pacman.looking_at);
		var py = dir_y(obj_pacman.looking_at);

		target_x = pac_cx + px * TILE_SIZE * 4;
		target_y = pac_cy + py * TILE_SIZE * 4;

		if (obj_pacman.looking_at == Direction.UP)
		{
		    target_x -= TILE_SIZE * 4;
		}
		break;
	
	case "Inky":
		var blinky = noone;

		with (obj_ghost)
		{
		    if (name == "Blinky")
		    {
		        blinky = id;
		    }
		}

		if (blinky != noone)
		{
		    var bx = blinky.x + blinky.sprite_width * 0.5;
		    var by = blinky.y + blinky.sprite_height * 0.5;

		    var ahead_x = pac_cx + dir_x(obj_pacman.looking_at) * TILE_SIZE * 2;
		    var ahead_y = pac_cy + dir_y(obj_pacman.looking_at) * TILE_SIZE * 2;

		    target_x = ahead_x + (ahead_x - bx);
		    target_y = ahead_y + (ahead_y - by);
		}
		break;
	
	case "Clyde":
	{
	    var dx = pac_cx - cx;
	    var dy = pac_cy - cy;

	    var dist2 = dx * dx + dy * dy;
	    var limit = sqr(TILE_SIZE * 8);

	    if (dist2 >= limit)
	    {
	        target_x = pac_cx;
	        target_y = pac_cy;
	    }
	    else
	    {
	        target_x = scatter_x;
	        target_y = scatter_y;
	    }

	    break;
	}
}

switch (state)
{
    case GhostState.IN_HOUSE:

        current_timer--;

        if (looking_at == Direction.UP)
        {
            if (abs(y - 128) < current_speed) {
				y = 128;
                looking_at = Direction.DOWN;
			}
        }
        else
        {
            if (abs(y - 137) < current_speed) {
				y = 137;
                looking_at = Direction.UP;
			}
        }

        y += dir_y(looking_at) * current_speed;

        if (current_timer <= 0)
        {
            state = GhostState.LEAVING_HOUSE;
        }

		exit;
		
	case GhostState.LEAVING_HOUSE:
		if (abs(cx - house_exit_cx) > 1)
		{
		    if (cx < house_exit_cx)
		    {
		        looking_at = Direction.RIGHT;
		        x += current_speed;
		    }
		    else
		    {
		        looking_at = Direction.LEFT;
		        x -= current_speed;
		    }
		}
		else
		{
		    x = house_exit_cx - sprite_width / 2;

		    looking_at = Direction.UP;

		    if (cy > house_exit_cy)
		    {
		        y -= current_speed;
		    }
		    else
		    {
		        y = house_exit_cy - sprite_height / 2;
				state = GhostState.MOVING;

				cx = x + sprite_width * 0.5;
				cy = y + sprite_height * 0.5;

				tile_x = floor(cx / TILE_SIZE);
				tile_y = floor((cy - MAZE_OFFSET_Y) / TILE_SIZE);

				choose_direction(tile_x, tile_y, scatter_x, scatter_y);
		        exit;
		    }
		}

		break;
	
	case GhostState.ENTERING_HOUSE:
	    looking_at = Direction.DOWN;

	    if (y < 128)
	    {
	        y += eaten_spd;
	    }
	    else
	    {
			var scx = xstart + sprite_width * .5;
			var scy = ystart + sprite_height * .5;
			if (abs(cx - scx) > 1) {
			    if (cx < scx)
			    {
			        looking_at = Direction.RIGHT;
			        x += current_speed;
			    }
			    else
			    {
			        looking_at = Direction.LEFT;
			        x -= current_speed;
				}
		    } else {
			    state = GhostState.IN_HOUSE;
		        mode = global.current_mode;
			    current_timer = house_timer;
				current_speed = spd;
				looking_at = Direction.UP;
			}
		}

	    exit;
	
	case GhostState.MOVING:
		if (on_node)
		{
		    ghost_move(center_x, center_y, tile_x, tile_y, cx, cy);
		}
		break;

}

if (state == GhostState.IN_HOUSE || state == GhostState.LEAVING_HOUSE) {
	exit;
}

var nx = cx + dir_x(looking_at) * current_speed;
var ny = cy + dir_y(looking_at) * current_speed;

if (can_walk(nx, ny, true))
{
    x += dir_x(looking_at) * current_speed;
    y += dir_y(looking_at) * current_speed;
}
check_tunnel();