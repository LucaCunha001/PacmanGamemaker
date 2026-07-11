if (keyboard_check(vk_left))  wanted_direction = Direction.LEFT;
if (keyboard_check(vk_right)) wanted_direction = Direction.RIGHT;
if (keyboard_check(vk_up))    wanted_direction = Direction.UP;
if (keyboard_check(vk_down))  wanted_direction = Direction.DOWN;

if (global.demo_recording)
{
    var last_dir = -1;

    if (wanted_direction != last_dir)
    {
        last_dir = wanted_direction;

        array_push(global.demo_events,
        {
            frame: global.demo_frame,
            dir: wanted_direction
        });
    }
}

if (global.game_state != GameState.PLAYING) {
	image_speed = 0;
	image_index = 0;
    exit;
}

if (!initialized) exit;

if (global.freeze_timer > 0) {
	visible = false;
    exit;
} else {
	visible = true;
}

image_speed = 0.2;

var cx = x + sprite_width * 0.5;
var cy = y + sprite_height * 0.5;

var probe = TILE_CENTER;

if (can_turn(cx, cy, wanted_direction, false))
{
    looking_at = wanted_direction;
}

var nx = cx + dir_x(looking_at) * spd;
var ny = cy + dir_y(looking_at) * spd;

if (can_walk(nx, ny, false))
{
    x += dir_x(looking_at) * spd;
    y += dir_y(looking_at) * spd;
} else {
	image_speed = 0;
}

check_tunnel();

if (global.demo_recording)
{
    global.demo_frame++;
}