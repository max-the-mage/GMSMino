/// @description tetromino controls
if(!audio_is_playing(music_intro) && !audio_is_playing(music_loop)) {
	audio_play_sound(music_loop, 5, true);
}

if(!global.pause) {
	if(das_left) {
		if(keyboard_check(vk_left)) {
			alarm[1] = room_speed/30;
		} else {
			alarm[1] = -1;
		}
		das_left = false;
	}

	if(das_right) {
		if(keyboard_check(vk_right)) {
			alarm[2] = room_speed/30;
		} else {
			alarm[2] = -1;
		}
		das_right = false;
	}

	if(falling) {
	
		current_mino.fall = true; // move down one cell in grid (if collision does not occur)
	
		if(soft_drop) {
			alarm[0] = room_speed / 30;
		} else {
			alarm[0] = room_speed * grav;
		}
		falling = false;
	}

	if(!current_mino.active) {
		var lowest_y = 0;
		var highest_y = 21;
		for(var i = 0; i < 4; i++) {
			var ya = current_mino.all_pos[i];
			
			if(ya[1] > lowest_y) {
				lowest_y = ya[1];
			}
			
			if(ya[1] < highest_y) {
				highest_y = ya[1];
			}
			
			if(ya[1] < 1) {
				audio_play_sound(snd_gameover, 5, false);
	
				global.fail = true;
				global.pause = true;
	
				pause_menu.active = true;
			}
		}
		
		if(!global.fail) {
			global.stack_top = highest_y;
		
			for(var line = highest_y; line <= lowest_y; line++) {
				lineclear(line);
			}
	
			if(ds_queue_size(piece_queue) < 8) {
				next_pieces();
			}
		
			var old_mino = current_mino.tetromino_type;
	
			update_queue = true;
			instance_destroy(current_mino);
			current_mino = instance_create_depth(0, 0, 1, obj_tetromino);
	
			if(held) {
				if(hold != undefined) {
					current_mino.tetromino_type = hold;
					can_hold = false;
				} else {
					current_mino.tetromino_type = ds_queue_dequeue(piece_queue);
					can_hold = true;
				}
				hold = old_mino;
				held = false;
			} else {
				can_hold = true;
				current_mino.tetromino_type = ds_queue_dequeue(piece_queue);
			}
			current_mino.all_pos = get_relative_minos(current_mino.grid_pos, current_mino.tetromino_type, 0);
			current_mino.mino_colour = global.mino_colours[? current_mino.tetromino_type];
	
			falling = true;
		}
	}
}