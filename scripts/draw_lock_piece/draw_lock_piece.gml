var tetromino = argument0;
var opacity = 1 - (argument1/(room_speed * .5)); // shows when pieces is about to lock with white overlay
var xpos;
var ypos;
var mino;

for(var xx = 0; xx < 4; xx++) {
	mino = tetromino[xx];
	xpos = global.cell_origin_x + (global.cell_size * mino[0]);
	ypos = global.cell_origin_y + (global.cell_size * mino[1]);
	
	draw_sprite_ext(spr_lock, 0, xpos, ypos, global.grid_scale, global.grid_scale, 0, c_white, opacity);
}