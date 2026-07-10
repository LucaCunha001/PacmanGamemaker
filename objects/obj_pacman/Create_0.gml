image_speed = 0;
initialized = false;

chomp_instance = noone;
global.until_mute_chomp = 0;

looking_at = Direction.LEFT;
wanted_direction = looking_at;

spd = 1;

depth--;

start_death_animation = function() {
	instance_create_depth(x, y, depth, obj_pacman_death);
	instance_destroy();
}