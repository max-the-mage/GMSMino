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