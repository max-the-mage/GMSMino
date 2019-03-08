/// @description Insert description here
// You can write your code in this editor

draw_set_colour(c_white);
draw_set_font(level_font);
draw_text(global.cell_origin_x + (11 * global.cell_size), global.cell_origin_y + (4 * global.cell_size), "Lines: " + string(lines))