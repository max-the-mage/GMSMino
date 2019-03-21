if(active) {
	menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

	menu_index += menu_move;
	
	if(global.fail && lowest != 1) lowest = 1;
	
	if(menu_index < lowest) menu_index = buttons - 1
	if(menu_index > buttons - 1) menu_index = lowest;
	
	
	if(last_selected != menu_index) {
		audio_play_sound(snd_menu_change, 0, false);
		last_selected = menu_index;
	}

}