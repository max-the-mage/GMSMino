/// @description Insert description here

grid_pos = [4, 1];
on_stack = false;

image_xscale = global.grid_scale;
image_yscale = global.grid_scale;

tetromino_type = "I"; // there is no such thing as constructor parameters in gml, so this will have to do
all_pos = get_relative_minos(grid_pos, tetromino_type, 0);
rotation = 0;
stalls = 0;
active = true;
fall_collision = false;
side_collision = false;
cells_since_stall = 0;

placed = false;

fall = false;

mino_colour = global.mino_colours[? tetromino_type];

horizontal_movement = 0;
rotation_input = 0;
ghost_piece = undefined;

//if(check_collision(all_pos, [0, 0]) && !global.fail) {
	//audio_play_sound(snd_gameover, 5, false);
	
	//global.fail = true;
	//global.pause = true;
	
	//active = false;
	//pause_menu.active = true;
//}

hard_drop = false;
