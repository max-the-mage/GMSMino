/// @description Hold function
if(!global.pause) {
	if(can_hold) {
		grid_update(current_mino.all_pos, c_white); // remove old mino from screen
		current_mino.active = false; // for next step iteration
	
		held = true; // tells creation script to grab the current piece from hold
		audio_play_sound(snd_hold, 0, false);
	} else {
		audio_play_sound(snd_holdfail, 0, false);
	}
}