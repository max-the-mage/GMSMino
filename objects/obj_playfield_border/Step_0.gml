/// @description Insert description here
// You can write your code in this editor

if(das_left) {
	if(keyboard_check(vk_left)) {
		alarm[1] = room_speed / 20;
	} else {
		alarm[1] = -1;
	}
	das_left = false;
}

if(das_right) {
	if(keyboard_check(vk_right)) {
		alarm[2] = room_speed / 20
	} else {
		alarm[2] = -1;
	}
	das_right = false;
}

if(falling) {
	
	current_mino.fall = true; // move down one cell in grid (if collision does not occur)
	
	var lowest_y = 0;
	var highest_y = 21;
	
	if(!current_mino.active) {
		for(var i = 0; i < 4; i++) {
			var ya = current_mino.all_pos[i];
			
			if(ya[1] > lowest_y) {
				lowest_y = ya[1];
			}
			
			if(ya[1] < highest_y) {
				highest_y = ya[1];
			}
		}
		
		global.stack_top = highest_y;
		
		
		
		for(var line = highest_y; line <= lowest_y; line++) {
			lineclear(line);
		}
		
		current_mino = instance_create_depth(0, 0, 1, obj_tetromino)
		if(ds_queue_size(piece_queue) < 8) {
			next_pieces();
		}
		current_mino = instance_create_depth(0, 0, 1, obj_tetromino)

		current_mino.tetromino_type = ds_queue_dequeue(piece_queue);
		current_mino.all_pos = get_relative_minos(current_mino.grid_pos, current_mino.tetromino_type, 0);
		current_mino.mino_colour = global.mino_colours[? current_mino.tetromino_type];
	} else {
		
		if(soft_drop) {
			alarm[0] = room_speed * power(grav_multiplier, 15);
		} else {
			alarm[0] = room_speed * grav;
		}
		falling = false;
	}

}