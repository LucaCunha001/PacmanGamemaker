blink_timer++;

if (blink_timer >= 30)
{
    blink_timer = 0;
    blink = !blink;
}

if (global.new_high_score_index != -1) {
	if (!keyboard_check_pressed(vk_anykey)) exit;
	
	var key = keyboard_lastchar;

	if (string_length(current_name) < 10)
	{
	    if (ord(key) >= ord(" ") && ord(key) <= ord("~"))
	    {
	        current_name += key;
	    }
	}
	
	if (keyboard_check_pressed(vk_backspace))
	{
	    current_name = string_delete(
	        current_name,
	        string_length(current_name),
	        1
	    );
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
	    global.high_scores[global.new_high_score_index].name = current_name;

	    save_scores();

	    global.new_high_score_index = -1;

	    room_goto(room_title);
	}
} else if (keyboard_check_pressed(vk_enter))
{
    room_goto(room_title);
}