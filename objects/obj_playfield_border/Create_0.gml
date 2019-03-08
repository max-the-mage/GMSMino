/// @description Insert description here
// You can write your code in this editor
global.rotation_data = ds_map_create();
global.rotation_data[? "I"] = [[[+0, +0], [-1, +0], [+1, +0], [2, +0]],
							   [[+0, +0], [+0, -1], [+0, +1], [+0, 2]],
							   [[+0, +0], [-1, +0], [+1, +0], [-2, +0]],
							   [[+0, +0], [+0, +1], [+0, -1], [+0, -2]]];
global.rotation_data[? "J"] = [[[+0, +0], [-1, +0], [-1, -1], [+1, +0]],
							   [[+0, +0], [+0, +1], [+0, -1], [+1, -1]],
							   [[+0, +0], [-1, +0], [+1, +0], [+1, +1]],
							   [[+0, +0], [+0, +1], [-1, +1], [+0, -1]]];
global.rotation_data[? "L"] = [[[+0, +0], [-1, +0], [+1, +0], [+1, -1]],
							   [[+0, +0], [+0, -1], [+0, +1], [+1, +1]],
							   [[+0, +0], [-1, +0], [-1, +1], [+1, +0]],
							   [[+0, +0], [+0, -1], [-1, -1], [+0, +1]]];
global.rotation_data[? "O"] = [[[+0, +0], [+1, +0], [+0, -1], [+1, -1]],
							   [[+0, +0], [+1, +0], [+0, +1], [+1, +1]],
							   [[+0, +0], [-1, +0], [+0, +1], [-1, +1]],
							   [[+0, +0], [-1, +0], [+0, -1], [-1, -1]]];
global.rotation_data[? "S"] = [[[+0, +0], [-1, +0], [+0, -1], [+1, -1]],
							   [[+0, +0], [+0, -1], [+1, +0], [+1, +1]],
							   [[+0, +0], [+1, +0], [+0, +1], [-1, +1]],
							   [[+0, +0], [+0, +1], [-1, +0], [-1, -1]]];
global.rotation_data[? "T"] = [[[+0, +0], [-1, +0], [+1, +0], [+0, -1]],
							   [[+0, +0], [+0, +1], [+1, +0], [+0, -1]],
							   [[+0, +0], [+1, +0], [-1, +0], [+0, +1]],
							   [[+0, +0], [-1, +0], [+0, +1], [+0, -1]]];
global.rotation_data[? "Z"] = [[[+0, +0], [+0, -1], [-1, -1], [+1, +0]],
							   [[+0, +0], [+1, +0], [+1, -1], [+0, +1]],
							   [[+0, +0], [+0, +1], [+1, +1], [-1, +0]],
							   [[+0, +0], [-1, +0], [-1, +1], [+0, -1]]];

global.SRS_tests = ds_map_create();
global.SRS_tests[? "I"] = [[[+0, +0], [-1, +0], [+2, +0], [-1, +0], [+2, +0]],
						   [[-1, +0], [+0, +0], [+0, +0], [+0, -1], [+0, +2]],
						   [[-1, -1], [+1, -1], [-2, -1], [+1, +0], [-2, +0]],
						   [[+0, -1], [+0, -1], [+0, -1], [+0, +1], [+0, -2]]];
global.SRS_tests[? "O"] =  [[0, 0], [0, +1], [-1, +1], [-1, 0]];
global.SRS_tests[? "other"] = [[[+0, +0], [+0, +0], [+0, +0], [+0, +0], [+0, +0]],
							   [[+0, +0], [+1, +0], [+1, +1], [+0, -2], [+1, -2]],
							   [[+0, +0], [+0, +0], [+0, +0], [+0, +0], [+0, +0]],
							   [[+0, +0], [+1, +0], [+1, +1], [+0, -2], [+1, -2]]];

piece_queue = ds_queue_create();

minos = ds_list_create();
minos[| 0] = "I";
minos[| 1] = "O";
minos[| 2] = "T";
minos[| 3] = "S";
minos[| 4] = "Z";
minos[| 5] = "J";
minos[| 6] = "L";

next_pieces();

globalvar level;
globalvar lines ;
globalvar points;

level = 1;
lines = 0;
points = 0;
grav_multiplier = (0.8-(level * 0.007))

grav = power(grav_multiplier, level)
falling = true;
soft_drop = false;

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

current_mino.tetromino_type = ds_queue_dequeue(piece_queue);
current_mino.all_pos = get_relative_minos(current_mino.grid_pos, current_mino.tetromino_type, 0);
current_mino.mino_colour = global.mino_colours[? current_mino.tetromino_type];

das_left = false;
das_right = false;

alarm[0] = room_speed * grav;