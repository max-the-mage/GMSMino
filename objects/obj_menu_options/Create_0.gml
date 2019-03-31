menu_x = x;
menu_y = y;

menu_difference = font_get_size(global.menu_font) * 1.2;
menu_index = 0;

button[0] = "Controls";
button[1] = "Music Volume: " + string(global.music_vol);
button[2] = "SFX Volume: " + string(global.sfx_vol);
button[3] = "Save & Exit";

buttons = array_length_1d(button);

last_selected = menu_index;