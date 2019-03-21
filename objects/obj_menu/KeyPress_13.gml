audio_play_sound(snd_menu_choose, 0, false);

if(options) {
	switch(menu_index) {
		case 2:
			options = false;
			break;
	}
} else {
	switch(menu_index) {
		case 0:
			draw_set_halign(fa_left);
			room_goto(room_play);
			audio_play_sound(music_intro, 10, false);
			break;
		case 1:
			options = true;
			menu_index = 0;
			break;
		case 2:
			game_end();
			break;
	}
}