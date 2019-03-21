global.menu_font = font_add("Potra.ttf", 75, false, false, 32, 128);

menu_x = x;
menu_y = y;
menu_difference = font_get_size(global.menu_font) * 1.2;

menu_index = 0;

button[0] = "Start Game"
button[1] = "Options"
button[2] = "Exit"

buttons = array_length_1d(button);

last_selected = menu_index;