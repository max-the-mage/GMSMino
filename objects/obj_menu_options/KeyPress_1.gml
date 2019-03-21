var input = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
switch(menu_index) {
	case 2:
		global.music_vol += input;
		
		if(global.music_vol < 0) global.music_vol = 0;
		if(global.music_vol > 10) global.music_vol = 10
		
		button[2] = "Music Volume: " + string(global.music_vol);
		
		audio_group_set_gain(audiogroup_music, global.music_vol * .1, 0);
		break;
	case 3:
		global.sfx_vol += input;
		
		if(global.sfx_vol < 0) global.sfx_vol = 0;
		if(global.sfx_vol > 10) global.sfx_vol = 10
		
		button[3] = "SFX Volume: " + string(global.sfx_vol);
		
		audio_group_set_gain(audiogroup_default, global.sfx_vol * .1, 0);
		break;
}

audio_play_sound(snd_menu_change, 0, false);
