menu_font = font_add("VCR_OSD_MONO_1.001.ttf", 50, false, false, 32, 128);

active = false;
lowest = 0

menu_x = x;
menu_y = y;
menu_difference = font_get_size(menu_font) * 1.8;

menu_index = 0;

button[0] = "Resume"
button[1] = "Retry"
button[2] = "Main Menu"

buttons = array_length_1d(button);

last_selected = menu_index;