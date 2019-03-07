/// @description Insert description here
// You can write your code in this editor

if(active && (fall || horizontal_movement != 0)) {
	grid_update(all_pos, c_white);
	
	fall_collision = check_collision(all_pos, [0, 1]);
		
	// only check left/right collision if horizontal movement is true
	if(horizontal_movement != 0) {
		right_collision = check_collision(all_pos, [1, 0]);
		left_collision = check_collision(all_pos, [-1, 0])
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
	
	
	all_pos = get_relative_minos(grid_pos, tetromino_type, rotation);
	grid_update(all_pos, mino_colour);
	
	fall = false;
	horizontal_movement = 0;
	left_collision = false;
	right_collision = false;
	
}

if(rotation_input != 0) {
	rotation += rotation_input;
	
	if(rotation < 0) {
		rotation = 3;
	} else if(rotation > 3) {
		rotation = 0;
	}
	
	grid_update(all_pos, c_white);
	all_pos = get_relative_minos(grid_pos, tetromino_type, rotation);
	grid_update(all_pos, mino_colour);
	
	rotation_input = 0;
}