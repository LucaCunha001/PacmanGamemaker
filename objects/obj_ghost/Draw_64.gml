if (global.show_debug) {
	var mode_text = name + ": ";
	switch (mode) {
		case GhostMode.CHASE:
			mode_text += "CHASE";
			draw_sprite_ext(spr_target, 0, target_x, target_y, 1, 1, 0, image_blend, .5);
			break;
		case GhostMode.SCATTER:
			mode_text += "SCATTER";
			draw_sprite_ext(spr_target, 0, scatter_x, scatter_y, 1, 1, 0, image_blend, .5);
			break;
		case GhostMode.FRIGHTHEN:
			mode_text += "FRIGHTHEN";
			break;
		case GhostMode.EATEN:
			mode_text += "EATEN";
			break;
	}
	
	var names = ["Blinky", "Inky", "Pinky", "Clyde"];
	
	draw_set_font(fnt_arcade);
	draw_set_colour(image_blend);
	draw_text(room_width + 10, 10 * array_get_index(names, name), mode_text);
}