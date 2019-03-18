menu_font = font_add("Goodlight.otf", 42, false, false, 32, 128);

active = false;

menu_x = x;
menu_y = y;
menu_difference = font_get_size(menu_font) * 2;

menu_index = 0;

button[0] = "Resume"
button[1] = "Retry"
button[2] = "Main Menu"

buttons = array_length_1d(button);

last_selected = menu_index;