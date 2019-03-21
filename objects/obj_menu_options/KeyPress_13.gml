audio_play_sound(snd_menu_choose, 0, false);

switch(menu_index) {
	case 1:
		instance_destroy();
		instance_create_depth(x, y, depth, obj_menu_controls);
		break;
	case 4:
		ini_open("settings.ini")
		ini_write_real("audio", "music", global.music_vol);
		ini_write_real("audio", "sfx", global.sfx_vol);
		ini_close();
		
		instance_destroy();
		instance_create_depth(x, y, depth, obj_menu);
		break;
}