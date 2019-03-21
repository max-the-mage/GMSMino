audio_play_sound(snd_menu_choose, 0, false);

switch(menu_index) {
	case 0:
		draw_set_halign(fa_left);
		room_goto(room_play);
		audio_play_sound(music_intro, 10, false);
		break;
	case 1:
		instance_create_depth(x, y, depth, obj_menu_options);
		instance_destroy();
		break;
	case 2:
		game_end();
		break;
}