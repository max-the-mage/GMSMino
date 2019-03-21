menu_x = x;
menu_y = y;

menu_difference = font_get_size(global.menu_font) * 1.2;

menu_index = 0;
change_key = false;

button_temp[0] = "Rotate CW: ";
button_temp[1] = "Rotate CCW: ";
button_temp[2] = "Hold: ";
button_temp[3] = "Hard Drop: ";

button[0] = "Rotate CW: " + string(key_to_string(global.controls[0]));
button[1] = "Rotate CCW: " + string(key_to_string(global.controls[1]));
button[2] = "Hold: " + string(key_to_string(global.controls[2]));
button[3] = "Hard Drop: " + string(key_to_string(global.controls[3]));
button[4] = "Back";

buttons = array_length_1d(button);

last_selected = menu_index;