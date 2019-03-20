
switch(menu_index) {
	case 0:
		active = false;
		global.pause = false;
		break;
	case 1:
		active = false;
		global.pause = false;
		with(playfield_main) {
			current_mino.active = false;
			instance_destroy(current_mino);
			event_perform(ev_create, 0);
		}
		break;
	case 2:
		audio_stop_sound(music_loop);
		audio_stop_sound(music_intro);
		with(playfield_main) {
			current_mino.active = false;
		}
		
		room_goto(room_menu);
		break;
}