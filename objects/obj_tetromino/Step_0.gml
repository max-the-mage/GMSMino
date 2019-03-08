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
	
	var prev_rotation = rotation;
	rotation += rotation_input;
	
	if(rotation < 0) {
		rotation = 3;
	} else if(rotation > 3) {
		rotation = 0;
	}
	
	grid_update(all_pos, c_white);
	
	var off = get_rotation_offset(prev_rotation, rotation);
	
	if(off == undefined) {
		rotation = prev_rotation;
	} else {
		grid_pos[0] += off[0];
		grid_pos[1] += off[1];
	
		all_pos = get_relative_minos(grid_pos, tetromino_type, rotation);
		grid_update(all_pos, mino_colour);	
		alarm[0] = -1;
	}
	
	rotation_input = 0;
}