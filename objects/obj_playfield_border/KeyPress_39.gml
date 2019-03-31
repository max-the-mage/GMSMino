/// @description start right movement

if(!global.pause) {
	current_mino.horizontal_movement = 1;
	alarm[1] = -1 // disables opposite DAS
	alarm[2] = room_speed / 5;
}