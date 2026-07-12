function act1() {
	if (timer == 0) {
		var pacman = instance_create_depth(room_width, room_height/2 - 6, -7, obj_intermission_actor);
		pacman.sprite_index = spr_pacman;
		pacman.image_speed = 0.2;
		array_push(actors, pacman);
		
		var blinky = instance_create_depth(room_width + 25, room_height/2 - 6, -8, obj_intermission_actor);
		blinky.sprite_index = spr_ghost_normal;
		blinky.image_blend = #ff0000;
		blinky.image_speed = 0.2;
		array_push(actors, blinky);
		
		var eyes = instance_create_depth(room_width + 26, room_height/2 - 5, -9, obj_intermission_actor);
		eyes.sprite_index = spr_eyes;
		array_push(actors, eyes);
	}
	
	if (timer < 340) {
		actors[0].x -= .8;
		actors[1].x -= .85;
		actors[2].x = actors[1].x + 1;
	}

	if (timer == 380) {
		var super_w = sprite_get_width(spr_superpacman);
		var super_h = sprite_get_height(spr_superpacman);
		
		var pac_right  = actors[0].x + (actors[0].sprite_width - sprite_get_xoffset(actors[0].sprite_index));
		var pac_bottom = actors[0].y + (actors[0].sprite_height - sprite_get_yoffset(actors[0].sprite_index));

		var super_x = pac_right - (super_w - sprite_get_xoffset(spr_superpacman));
		var super_y = pac_bottom - (super_h - sprite_get_yoffset(spr_superpacman));
		
		actors[0].sprite_index = spr_superpacman;
		actors[0].y = super_y;
		actors[0].x = actors[1].x;
		actors[1].x = -10;
		actors[1].sprite_index = spr_ghost_fright;
		actors[1].image_blend = c_white;
	}
    if (timer > 380) {
		actors[1].x += .6;
	}
	if (actors[1].x - 16 > room_width / 2 && timer > 340) {
		actors[0].x += 1.4;
	}
	
	if (actors[0].x > room_width + 25) {
        state = IntermissionState.END;
		with (obj_intermission_actor) instance_destroy();
	}
}

function act2() {
	if (timer == 0) {
        var pacman = instance_create_depth(room_width, room_height/2 - 6, -7, obj_intermission_actor);
        pacman.sprite_index = spr_pacman;
        pacman.image_speed = 0.2;
        array_push(actors, pacman);

        var blinky = instance_create_depth(room_width + 25, room_height/2 - 6, -8, obj_intermission_actor);
        blinky.sprite_index = spr_ghost_normal;
        blinky.image_blend = #ff0000;
        blinky.image_speed = 0.2;
        array_push(actors, blinky);

        var eyes = instance_create_depth(room_width + 26, room_height/2 - 5, -9, obj_intermission_actor);
        eyes.sprite_index = spr_eyes;
        array_push(actors, eyes);

        punctured = false;
        torn = noone;

        var spike = instance_create_depth(
            room_width / 2,
            room_height / 2 + 2,
            -6,
            obj_intermission_actor
        );
        spike.sprite_index = spr_intermission_spike;
        array_push(actors, spike);
    }

    actors[0].x -= .8;

    if (!punctured) {
        var speed_ = (actors[1].x + 16 <= actors[3].x) ? .4 : .85;

        actors[1].x -= speed_;
        actors[2].x = actors[1].x + 1;

        if (actors[1].x + 16 <= actors[3].x) {
            punctured = true;

            torn = instance_create_depth(
                actors[1].x + 4,
                actors[1].y + 4,
                actors[1].depth + 1,
                obj_intermission_actor
            );
            torn.sprite_index = spr_blinky_torn;

            puncture_timer = timer;
        }
    } else {
        var dt = timer - puncture_timer;

        if (dt < 10) {
            actors[1].x -= .4;
        }
		
		else if (dt == 10) {
			actors[1].image_speed = 0;
		}
		
        else if (dt < 100 && dt > 60) {
            actors[1].sprite_index = spr_blinky_torning;
            actors[1].image_speed = 0;
            actors[1].image_index = 0;
			actors[1].image_blend = c_white;
        }

        else if (dt > 140) {
            actors[1].image_index = 1;
        }
		
		if (dt < 60) {
	        actors[2].x = actors[1].x + 1;
		} else if (dt == 60) {
            torn.image_index = 1;
            with (actors[2]) instance_destroy();
		}
    }

    if (actors[0].x < -148) {
        state = IntermissionState.END;
        with (obj_intermission_actor) instance_destroy();
    }
}