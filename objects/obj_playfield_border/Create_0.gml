/// @description Insert description here

randomize(); // randomizes seed on every play

global.pause = false;
global.fail = false;

ds_grid_clear(global.grid, c_white); // grid uses colours as values, white means nothing
ds_queue_clear(global.queue); 
global.drawn_queue = [];

next_pieces();

level = 1; // TODO: Customizable starting level
lines = 0; 
points = 0; // TODO: scoring

grav_multiplier = (0.8-((level-1) * 0.007)); 
grav = power(grav_multiplier, level-1); // TODO: support gravity > 1 cell per frame

falling = true;
soft_drop = false;

hold = undefined;
held = false;
can_hold = true;

update_queue = true;

global.cell_origin_x = x + (global.cell_size / 4);
global.cell_origin_y = y + (global.cell_size / 4) - (global.cell_size * 2);

image_xscale = global.grid_scale;
image_yscale = global.grid_scale;

current_mino = instance_create_depth(0, 0, 1, obj_tetromino);

current_mino.tetromino_type = ds_queue_dequeue(global.queue);
current_mino.all_pos = get_relative_minos(current_mino.grid_pos, current_mino.tetromino_type, 0);
current_mino.mino_colour = global.mino_colours[? current_mino.tetromino_type];

das_left = false;
das_right = false;

alarm[0] = room_speed * grav;
