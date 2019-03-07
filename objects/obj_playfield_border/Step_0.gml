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
	
	if(!current_mino.active) {
		current_mino = instance_create_depth(0, 0, 1, obj_tetromino)
	} else {
		alarm[0] = room_speed * grav;
		falling = false;
	}

}