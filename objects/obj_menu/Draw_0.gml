
var i = 0;
repeat(buttons) {
	draw_set_font(menu_font);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	
	if(menu_index == i) draw_set_color(c_red);
	
	draw_text(menu_x, menu_y + (menu_difference * i), button[i]);
	
	i++;
}