audio_play_sound(snd_menu_choose, 0, false);

switch(menu_index) {
	case 0:
		button[0] = "Rotate CW: Press Any Key";
		break;
	case 4:
		instance_destroy();
		instance_create_depth(x, y, depth, obj_menu);
		break;
}
