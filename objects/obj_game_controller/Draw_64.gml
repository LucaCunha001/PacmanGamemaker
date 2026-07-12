if (!global.show_debug) exit;

var mode_text = "";
switch (global.current_mode) {
	case GhostMode.CHASE:
		mode_text = "CHASE";
		break;
	case GhostMode.EATEN:
		mode_text = "EATEM";
		break;
	case GhostMode.FRIGHTHEN:
		mode_text = "FRIGHTHEN";
		break;
	case GhostMode.SCATTER:
		mode_text = "SCATTER";
		break;
}
draw_set_colour(c_white);
draw_text(room_width + 10, 40, "Mode: " + mode_text);