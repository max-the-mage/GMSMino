switch(menu_index) {
	case 0:
		draw_set_halign(fa_left);
		room_goto(room_play);
		break;
	case 2:
		game_end();
		break;
}