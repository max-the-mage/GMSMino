active = false;
lowest = 0

menu_x = x;
menu_y = y;
menu_difference = font_get_size(global.menu_font) * 1.8;

menu_index = 0;

button[0] = "Resume"
button[1] = "Retry"
button[2] = "Main Menu"

buttons = array_length_1d(button);

last_selected = menu_index;