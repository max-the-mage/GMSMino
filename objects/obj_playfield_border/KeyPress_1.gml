if(!global.pause) {
	if(keyboard_lastkey == global.controls[? "harddrop"]) {
		current_mino.hard_drop = true;
		audio_play_sound(snd_harddrop, 0, false);
	} else if(keyboard_lastkey == global.controls[? "hold"]) {
		if(can_hold) {
			grid_update(current_mino.all_pos, c_white); // remove old mino from screen
			current_mino.active = false; // for next step iteration
	
			held = true; // tells creation script to grab the current piece from hold
			audio_play_sound(snd_hold, 0, false);
		} else {
			audio_play_sound(snd_holdfail, 0, false);
		}
	} else if(keyboard_lastkey == global.controls[? "cw"]) {
		current_mino.rotation_input = 1;
	} else if(keyboard_lastkey == global.controls[? "ccw"]) {
		current_mino.rotation_input = -1;
	}
}