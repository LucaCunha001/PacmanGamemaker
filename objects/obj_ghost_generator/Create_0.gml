var ghosts_info = [
	{
		"name": "Blinky",
		"pos_x": 105,
		"pos_y": 109,
		"color": #FF0000,
		"looking": Direction.LEFT,
		"house_timer": 0,
		"scatter_x": room_width - 1,
		"scatter_y": 24
	},
	{
		"name": "Inky",
		"pos_x": 89,
		"pos_y": 133,
		"color": #00FFFF,
		"looking": Direction.UP,
		"house_timer": 5,
		"scatter_x": room_width - 9,
		"scatter_y": room_height - 9
	},
	{
		"name": "Pinky",
		"pos_x": 105,
		"pos_y": 133,
		"color": #FFB8FF,
		"looking": Direction.DOWN,
		"house_timer": 2,
		"scatter_x": 4,
		"scatter_y": 24
	},
	{
		"name": "Clyde",
		"pos_x": 121,
		"pos_y": 133,
		"color": #FFB852,
		"looking": Direction.UP,
		"house_timer": 8,
		"scatter_x": 4,
		"scatter_y": room_height - 9
	}
];

array_foreach(ghosts_info, function(info, index) {
	var ghost = instance_create_depth(info[$ "pos_x"], info[$ "pos_y"], -2, obj_ghost);
	ghost.image_blend = info[$ "color"];
	ghost.name = info[$ "name"];
	ghost.looking_at = info[$ "looking"];
	ghost.house_timer = game_get_speed(gamespeed_fps) * info[$ "house_timer"];
	ghost.current_timer = ghost.house_timer;
	ghost.scatter_x = info[$ "scatter_x"];
	ghost.scatter_y = info[$ "scatter_y"];
	if (ghost.name == "Blinky") ghost.state = GhostState.MOVING;
});

any_fright = false;
any_eye = false;