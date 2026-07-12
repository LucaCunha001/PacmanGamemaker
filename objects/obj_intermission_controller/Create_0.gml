state = IntermissionState.START;

act = 0;
timer = 0;
actors = [];

speed = 1;

global.game_state = GameState.INTERMISSION;

// global.level = 5;

start_intermission = function() {
	switch(global.level)
	{
	    case 2:
	        act = 1;
	        break;

	    case 5:
	        act = 2;
	        break;

	    case 9:
	    case 13:
	    case 17:
	        act = 3;
	        break;

	    default:
	        instance_destroy();
	        exit;
	}
}

start_intermission();