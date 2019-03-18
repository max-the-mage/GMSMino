
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
			event_perform(ev_create, 0);
		}
		break;
	case 2:
		room_goto(room_menu);
		with(playfield_main) {
			current_mino.active = false;
			event_perform(ev_create, 0);
		}
		break;
}