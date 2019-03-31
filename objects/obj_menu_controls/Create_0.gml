menu_x = x;
menu_y = y;

menu_difference = font_get_size(global.menu_font) * 1.2;

menu_index = 0;
change_key = false;

button_temp[0] = "Rotate CW: ";
button_temp[1] = "Rotate CCW: ";
button_temp[2] = "Hold: ";
button_temp[3] = "Hard Drop: ";

for(var i = 0; i < array_length_1d(button_temp); i++)
	button[i] = button_temp[i] + string(key_to_string(global.controls[i]));

button[4] = "Back";

buttons = array_length_1d(button);

last_selected = menu_index;