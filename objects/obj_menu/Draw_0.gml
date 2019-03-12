
var i = 0;
var current_text;
repeat(buttons) {
	draw_set_font(menu_font);
	
	draw_set_color(c_white);
	
	if(menu_index == i) draw_set_color(c_red);
	
	if(options) current_text = obutton[i];
	else current_text = button[i];
	
	draw_text(menu_x, menu_y + (menu_difference * i), current_text);
	
	i++;
}