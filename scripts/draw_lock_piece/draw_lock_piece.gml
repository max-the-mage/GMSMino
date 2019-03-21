var tetromino = argument0;
var opacity = 1 - (argument1/(room_speed * .5));
var xpos;
var ypos;

for(var xx = 0; xx < 4; xx++) {
	var mino = tetromino[xx];
	xpos = global.cell_origin_x + (global.cell_size * mino[0]);
	ypos = global.cell_origin_y + (global.cell_size * mino[1]);
	
	ghost_sprite = draw_sprite_ext(spr_lock, 0, xpos, ypos, global.grid_scale, global.grid_scale, 0, c_white, opacity);
}