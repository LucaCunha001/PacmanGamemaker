image_speed = 0;
initialized = false;

chomp_instance = noone;
global.until_mute_chomp = 0;

looking_at = Direction.LEFT;
wanted_direction = looking_at;

spd = get_level_speed("pacman");

depth--;

start_death_animation = function() {
	instance_create_depth(x, y, depth, obj_pacman_death);
	instance_destroy();
	if (global.demo_recording) demo_stop_record();
}