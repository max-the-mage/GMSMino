/// @description Insert description here
// You can write your code in this editor

if(active && (fall || horizontal_movement != 0)) {
	var lowest = 0;
	var leftmost = 0;
	var rightmost = 0;
	var mino;
	
	for(var i = 0; i < 4; i++) {
		mino = all_pos[i];
		
		// leftmost x mino
		if(mino[0] < leftmost) {
			leftmost = mino[0];
		}
		
		// rightmost x mino
		if(mino[0] > rightmost) {
			rightmost = mino[0];
		}
		
		// lowest mino y
		if(mino[1] > lowest) {
			lowest = mino[1];
		}
	}
	for(var i = 0; i < 4; i++) {
		mino = all_pos[i];
		
		if(mino[1] == lowest && !fall_collision) {
			fall_collision = check_collision(mino[0], mino[1] + 1);
		}
		
		// only check left/right collision if horizontal movement is true
		if(horizontal_movement != 0) {
			if(mino[0] == rightmost && !right_collision) {
				right_collision = check_collision(mino[0]+1, mino[1]);
			}
			
			if(mino[0] == leftmost && !left_collision) {
				left_collision = check_collision(mino[0]-1, mino[1])
			}
		}
	}
	
	
	if(fall) {
		if(fall_collision) {		
			alarm[0] = room_speed * 0.5;
		} else {
			grid_pos[1] += 1;
			alarm[0] = -1;
		}
	}
	
	if((horizontal_movement < 0 && !left_collision) || (horizontal_movement > 0 && !right_collision)) {
		grid_pos[0] += horizontal_movement;
	}
	
	grid_update(all_pos, c_white);
	
	all_pos = get_relative_minos(grid_pos, tetromino_type);
	grid_update(all_pos, mino_colour);
	
	fall = false;
	horizontal_movement = 0;
	left_collision = false;
	right_collision = false;
	
}

draw_grid()