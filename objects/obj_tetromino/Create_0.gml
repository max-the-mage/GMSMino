/// @description Insert description here
// You can write your code in this editor
grid_pos = [4, 2];

//x = global.cell_origin_x + (grid_pos[1] * global.cell_size);
//y = global.cell_origin_y + (grid_pos[0] * global.cell_size);
 
image_xscale = global.grid_scale;
image_yscale = global.grid_scale;

tetromino_type = "I";
all_pos = get_relative_minos(grid_pos, tetromino_type, 0);
rotation = 0;
active = true;
fall_collision = false;
left_collision = false;
right_collision = false;

fall = false;

mino_colour = global.mino_colours[? tetromino_type];

horizontal_movement = 0;
rotation_input = 0;

//show_debug_message(all_pos);
