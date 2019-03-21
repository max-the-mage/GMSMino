if(active) {

	var i = 0;
	var current_text;
	repeat(buttons) {
		draw_set_font(menu_font);
		draw_set_color(c_white);
		
		if(global.fail && i == 0)
			draw_set_color(c_dkgray);
		else if(menu_index == i)
			draw_set_color(c_red);
	
		draw_text(menu_x, menu_y + (menu_difference * i), button[i]);
	
		i++;
	}
}