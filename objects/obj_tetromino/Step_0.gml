/// @description tetromino movement

// if rotation button is pressed

if(!global.pause) {
	if(active) {
		grid_update(all_pos, c_white);
		if(rotation_input != 0) {
		
			var prev_rotation = rotation;
			rotation += rotation_input;
	
			if(rotation < 0) {
				rotation = 3;
			} else if(rotation > 3) {
				rotation = 0;
			}
	
			var off = get_rotation_offset(prev_rotation, rotation);
	
			if(off == undefined) {
				rotation = prev_rotation;
				audio_play_sound(snd_rotate_fail, 0, false);
			} else {
				grid_pos[0] += off[0];
				grid_pos[1] += off[1];
				
				audio_play_sound(snd_rotate, 0, false);
		
				alarm[0] = -1;
			}
	
			all_pos = get_relative_minos(grid_pos, tetromino_type, rotation);
	
			rotation_input = 0;
		}

		
		if(horizontal_movement != 0) {
			side_collision = check_collision(all_pos, [horizontal_movement, 0]);
				
		if(!side_collision) {
			audio_play_sound(snd_move, 0, false);
			
			grid_pos[0] += horizontal_movement;
			all_pos = get_relative_minos(grid_pos, tetromino_type, rotation);
				alarm[0] = -1;
			}
				
			horizontal_movement = 0;
		}
		
		if(fall) {
			fall_collision = check_collision(all_pos, [0, 1]);
			
			if(fall_collision) {
				
				if(alarm[0] == -1) {
					alarm[0] = room_speed * 0.5;
				}
				if(!on_stack) audio_play_sound(snd_stackhit, 0, false);
				
				on_stack = true;
			} else {
				on_stack = false;
				grid_pos[1] += 1;
				alarm[0] = -1;
			}
			all_pos = get_relative_minos(grid_pos, tetromino_type, rotation);
			fall = false;
		}
		
		
		ghost_piece = get_ghost_piece();
		
		
		
		grid_update(all_pos, mino_colour);

		if(hard_drop) {
			grid_update(all_pos, c_white);
			all_pos = ghost_piece;
			grid_update(all_pos, mino_colour);
	
			hard_drop = false;
			active = false;
		}
	}
}