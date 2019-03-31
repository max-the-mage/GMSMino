// @description Controls

if(!global.pause) {
	// hard drop
	if(keyboard_check_pressed(global.controls[3])) {
		current_mino.hard_drop = true;
		audio_play_sound(snd_harddrop, 0, false);
	}
	
	// hold
	if(keyboard_check_pressed(global.controls[2])) {
		if(can_hold) {
			grid_update(current_mino.all_pos, c_white); // remove old mino from screen
			current_mino.active = false; // for next step iteration
	
			held = true; // tells creation script to grab the current piece from hold
			audio_play_sound(snd_hold, 0, false);
		} else {
			audio_play_sound(snd_holdfail, 0, false);
		}
	}
	
	// rotate CW
	if(keyboard_check_pressed(global.controls[0])) {
		current_mino.rotation_input = 1;
	}
	
	/// rotate CCW
	if (keyboard_check_pressed(global.controls[1])) {
		current_mino.rotation_input = -1;
	}
}