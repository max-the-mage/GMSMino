var used = false;

if(change_key && keyboard_lastkey == vk_escape) {
	change_key = false;
	button[menu_index] = button_temp[menu_index] + string(key_to_string(global.controls[menu_index]));
} else if(change_key && keyboard_lastkey != vk_enter && keyboard_lastkey != vk_left && keyboard_lastkey != vk_right && keyboard_lastkey != vk_down) {
	
	for(var i = 0; i < array_length_1d(global.controls); i++) {
		if(keyboard_lastkey == global.controls[i] && i != menu_index) {
			used = true;
		}
	}
	
	if(!used) {
		button[menu_index] = button_temp[menu_index] + string(key_to_string(keyboard_lastkey));
		global.controls[menu_index] = keyboard_lastkey;
		change_key = false;
	} else {
		audio_play_sound(snd_holdfail, 0, false);
	}
}