audio_play_sound(snd_menu_choose, 0, false);

switch(menu_index) {
	case 0:
		instance_destroy();
		instance_create_depth(x, y, depth, obj_menu_controls);
		break;
	case 3:
		ini_open("settings.ini")
		ini_write_real("audio", "music", global.music_vol);
		ini_write_real("audio", "sfx", global.sfx_vol);
		
		ini_write_real("controls", "cw", global.controls[0]);
		ini_write_real("controls", "ccw", global.controls[1]);
		ini_write_real("controls", "hold", global.controls[2]);
		ini_write_real("controls", "harddrop", global.controls[3]);
		
		ini_close();
	
		instance_destroy();
		instance_create_depth(x, y, depth, obj_menu);
		break;
}