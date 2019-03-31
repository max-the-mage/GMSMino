var ghost = argument0;
var xpos;
var ypos;
var mino;

for(var xx = 0; xx < 4; xx++) {
	mino = ghost[xx];
	xpos = global.cell_origin_x + (global.cell_size * mino[0]);
	ypos = global.cell_origin_y + (global.cell_size * mino[1]);
	
	draw_sprite_ext(spr_ghost, 0, xpos, ypos, global.grid_scale, global.grid_scale, 0, mino_colour, 1);
	
}