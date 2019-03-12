menu_font = font_add("Goodlight.otf", 42, false, false, 32, 128);

options = false;

menu_x = x;
menu_y = y;
menu_difference = font_get_size(menu_font) * 2;

menu_index = 0;

button[0] = "Start Game"
button[1] = "Options"
button[2] = "Exit"

obutton[0] = "Key Bindings";
obutton[1] = "DAS Tuning";
obutton[2] = "Back";
buttons = array_length_1d(button);

last_selected = menu_index;