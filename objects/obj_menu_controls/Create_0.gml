menu_x = x;
menu_y = y;

menu_difference = font_get_size(global.menu_font) * 2;

menu_index = 0;

button[0] = "Rotate CW: " + string(key_to_string(global.controls[? "cw"]));
button[1] = "Rotate CCW: " + string(key_to_string(global.controls[? "ccw"]));
button[2] = "Hold: " + string(key_to_string(global.controls[? "hold"]));
button[3] = "Hard Drop: " + string(key_to_string(global.controls[? "harddrop"]));
button[4] = "Save & Exit";

buttons = array_length_1d(button);

last_selected = menu_index;