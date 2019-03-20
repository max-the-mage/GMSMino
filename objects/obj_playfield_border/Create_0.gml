/// @description Insert description here
// You can write your code in this editor
randomize();


global.pause = false;


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
globalvar lines;
globalvar points;

level = 1;
lines = 0;
points = 0;

grav_multiplier = (0.8-((level-1) * 0.007));
grav = power(grav_multiplier, level-1);

falling = true;
soft_drop = false;
loop = false;

hold = undefined;
held = false;
can_hold = true;
refresh = false;

global.queue = [];

global.grid_scale = window_get_height() / 1440;
global.cell_size = global.grid_scale * 64;

global.level_font = font_add("Goodlight.otf", global.cell_size/2, false, false, 32, 128);

global.cell_origin_x = x + (global.cell_size / 4);
global.cell_origin_y = y + (global.cell_size / 4) - (global.cell_size * 2);

ds_grid_clear(global.grid, c_white);


image_xscale = global.grid_scale;
image_yscale = global.grid_scale;
update_queue = true;

current_mino = instance_create_depth(0, 0, 1, obj_tetromino)

current_mino.tetromino_type = ds_queue_dequeue(piece_queue);
current_mino.all_pos = get_relative_minos(current_mino.grid_pos, current_mino.tetromino_type, 0);
current_mino.mino_colour = global.mino_colours[? current_mino.tetromino_type];

das_left = false;
das_right = false;

alarm[0] = room_speed * grav;