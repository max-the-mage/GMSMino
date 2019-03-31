/// @description initialize global variables

global.rotation_data = ds_map_create();

// grabs settings (controls & volume)
ini_open("settings.ini");

global.sfx_vol = ini_read_real("audio", "sfx", 8);
global.music_vol = ini_read_real("audio", "music", 10);

global.controls[0] = ini_read_real("controls", "cw", ord("X"));
global.controls[1] = ini_read_real("controls", "ccw", ord("Z"));
global.controls[2] = ini_read_real("controls", "hold", ord("C"));
global.controls[3] = ini_read_real("controls", "harddrop", vk_space);

ini_close();

audio_group_load(audiogroup_music); // load music, smol file to it's fine to keep it in memory
audio_group_set_gain(audiogroup_music, global.music_vol * .1, 0); // settings have audio as 0 - 10 but gamemaker uses 0 - 10
audio_group_set_gain(audiogroup_default, global.sfx_vol * .1, 0);

global.grid_scale = window_get_height() / 1440; // max window size 1440p (full scale sprites are at 1440p)
global.cell_size = global.grid_scale * 64; // tetromino sprite is 64x64, this scales the grid cells accordingly

// fonts
global.level_font = font_add("VCR_OSD_MONO_1.001.ttf", global.cell_size * .75, false, false, 32, 128);

// All offsets for each mino, with each basic rotation (this is more effecient than using matrix calculations
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

// offsets for SRS (O offsets for every rotation to avoid "wobble", I has its own offsets)
global.SRS_tests = ds_map_create();
global.SRS_tests[? "I"] = [[[+0, +0], [-1, +0], [+2, +0], [-1, +0], [+2, +0]],
						   [[-1, +0], [+0, +0], [+0, +0], [+0, -1], [+0, +2]],
						   [[-1, -1], [+1, -1], [-2, -1], [+1, +0], [-2, +0]],
						   [[+0, -1], [+0, -1], [+0, -1], [+0, +1], [+0, -2]]];
global.SRS_tests[? "O"] =  [[0, 0], [0, +1], [-1, +1], [-1, 0]];
global.SRS_tests[? "other"] = [[[+0, +0], [+0, +0], [+0, +0], [+0, +0], [+0, +0]],
							   [[+0, +0], [+1, +0], [+1, +1], [+0, -2], [+1, -2]],
							   [[+0, +0], [+0, +0], [+0, +0], [+0, +0], [+0, +0]],
							   [[+0, +0], [-1, +0], [-1, +1], [+0, -2], [-1, -2]]];
global.stack_top = 21;

// colour overlay for each tetromino
global.mino_colours = ds_map_create();
global.mino_colours[? "I"] = make_colour_rgb(0, 255, 255);
global.mino_colours[? "O"] = make_colour_rgb(255, 255, 0);
global.mino_colours[? "T"] = make_colour_rgb(167, 35, 255);
global.mino_colours[? "S"] = make_colour_rgb(0, 255, 0);
global.mino_colours[? "Z"] = make_colour_rgb(255, 0, 0);
global.mino_colours[? "J"] = make_colour_rgb(0, 72, 255);
global.mino_colours[? "L"] = make_colour_rgb(255, 127, 0);


// next piece queue
global.queue = ds_queue_create();
// can't view more than the head of a queue, so this is to display the 5 next pieces
// I could re-copy the global queue every time it's drawn, but that adds a fairly massive memory overhead,
// and could cause a massive memory leak
global.drawn_queue = [];
global.minos = ds_list_create();

global.minos[| 0] = "I";
global.minos[| 1] = "O";
global.minos[| 2] = "T";
global.minos[| 3] = "S";
global.minos[| 4] = "Z";
global.minos[| 5] = "J";
global.minos[| 6] = "L";

// main grid
global.grid = ds_grid_create(10, 22);

// scoring stuff
globalvar level;
globalvar lines;
globalvar points;
