/// @description Insert description here
// You can write your code in this editor
global.rotation_data = ds_map_create();
global.rotation_data[? "I"] = [[[0, 0], [-1, 0], [1, 0], [2, 0]],
							   [[0, 0], [0, -1], [0, 1], [0, 2]],
							   [[0, 0], [-1, 0], [1, 0], [-2, 0]],
							   [[0, 0], [0, 1], [0, -1], [0, -2]]];
global.rotation_data[? "J"] = [[[0, 0], [-1, 0], [-1, -1], [1, 0]],
							   [[0, 0], [0, -1], [1, 1], [0, 1]],
							   [[0, 0], [-1, 0], [1, 0], [1, 1]],
							   [[0, 0], [0, 1], [-1, 1], [0, -1]]];
global.rotation_data[? "L"] = [[[0, 0], [-1, 0], [1, 0], [1, -1]],
							   [[0, 0], [0, 1], [1, 0], [1, -1]],
							   [[0, 0], [-1, 0], [-1, 1], [1, 0]],
							   [[0, 0], [0, -1], [-1, -1], [0, 1]]];
global.rotation_data[? "O"] = [[[0, 0], [1, 0], [0, -1], [1, -1]],
							   [[0, 0], [1, 0], [0, 1], [1, 1]],
							   [[0, 0], [-1, 0], [0, -1], [-1, -1]],
							   [[0, 0], [-1, 0], [0, 1], [-1, 1]]];
global.rotation_data[? "S"] = [[[0, 0], [-1, 0], [0, -1], [1, -1]]];
global.rotation_data[? "T"] = [[[0, 0], [-1, 0], [1, 0], [0, -1]]];
global.rotation_data[? "Z"] = [[[0, 0], [0, -1], [-1, -1], [1, 0]]];

globalvar level;
globalvar points;

level = 2;
points = 0;
grav = (0.8-(level * 0.007))

grav = power(grav, level)
falling = true;

global.mino_colours = ds_map_create();
global.mino_colours[? "I"] = c_aqua;
global.mino_colours[? "O"] = c_yellow;
global.mino_colours[? "T"] = c_purple;
global.mino_colours[? "S"] = c_green;
global.mino_colours[? "Z"] = c_red;
global.mino_colours[? "J"] = c_blue;
global.mino_colours[? "L"] = c_orange;


global.grid_scale = window_get_height() / 1440;
global.cell_size = global.grid_scale * 64;

global.cell_origin_x = x + (global.cell_size / 4);
global.cell_origin_y = y + (global.cell_size / 4) - (global.cell_size * 2);

global.grid = ds_grid_create(10, 22);
ds_grid_clear(global.grid, c_white);


image_xscale = global.grid_scale;
image_yscale = global.grid_scale;

current_mino = instance_create_depth(0, 0, 1, obj_tetromino)
das_left = false;
das_right = false;

alarm[0] = room_speed * grav;