audio_play_sound(snd_menu_choose, 0, false);

if(menu_index < 4) {
	button[menu_index] = button_temp[menu_index] + "Press Any Key";
	change_key = true;
} else {
	instance_destroy();
	instance_create_depth(x, y, depth, obj_menu_options);
}
