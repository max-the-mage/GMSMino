/// @description start left movement

if(!global.pause) {
	current_mino.horizontal_movement = -1;
	alarm[2] = -1; // disables opposite DAS
	alarm[1] = room_speed / 5;
}