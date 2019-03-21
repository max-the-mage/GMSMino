/// @description initialize global variables

global.rotation_data = ds_map_create();
//global.controls = ds_map_create();

ini_open("settings.ini");

global.sfx_vol = ini_read_real("audio", "sfx", 8);
global.music_vol = ini_read_real("audio", "music", 10);

global.controls[0] = ini_read_real("controls", "cw", ord("X"));
global.controls[1] = ini_read_real("controls", "ccw", ord("Z"));
global.controls[2] = ini_read_real("controls", "hold", ord("C"));
global.controls[3] = ini_read_real("controls", "harddrop", vk_space);

//global.controls[? "hold"] = ini_read_real("controls", "hold", ord("C"));
//global.controls[? "ccw"] = ini_read_real("controls", "ccw", ord("Z"));
//global.controls[? "cw"] = ini_read_real("controls", "cw", ord("X"));
//global.controls[? "harddrop"] = ini_read_real("controls", "harddrop", vk_space);

ini_close();

audio_group_load(audiogroup_music);
audio_group_set_gain(audiogroup_music, global.music_vol * .1, 0);
audio_group_set_gain(audiogroup_default, global.sfx_vol * .1, 0);

// All offsets for each mino, with each rotation
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
							   [[+0, +0], [-1, +0], [-1, +1], [+0, -2], [-1, -2]]];

global.stack_top = 21;

global.mino_colours = ds_map_create();
global.mino_colours[? "I"] = make_colour_rgb(0, 255, 255);
global.mino_colours[? "O"] = make_colour_rgb(255, 255, 0);
global.mino_colours[? "T"] = make_colour_rgb(167, 35, 255);
global.mino_colours[? "S"] = make_colour_rgb(0, 255, 0);
global.mino_colours[? "Z"] = make_colour_rgb(255, 0, 0);
global.mino_colours[? "J"] = make_colour_rgb(0, 72, 255);
global.mino_colours[? "L"] = make_colour_rgb(255, 127, 0);




global.grid = ds_grid_create(10, 22);

globalvar level;
globalvar lines;
globalvar points;

