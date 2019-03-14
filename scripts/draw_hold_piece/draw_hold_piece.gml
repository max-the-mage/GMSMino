if(hold != undefined) {
	var tetromino = get_relative_minos([0, 0], hold, 0);
	var mino_colour = global.mino_colours[? hold];
	var origin = [global.cell_origin_x - (global.cell_size * 3) + 8, global.cell_origin_y + (global.cell_size * 5)];
	var cell_size = global.cell_size * .75;
	var scale = global.grid_scale * .75;
	
	var xpos, ypos;
	
	for(var xx = 0; xx < 4; xx++) {
		
		var mino = tetromino[xx];
		xpos = origin[0] + cell_size * mino[0];
		ypos = origin[1] + cell_size * mino[1];
		
		if(hold != "I" && hold != "O") {
			xpos += cell_size/2;
		}
		
		if(!can_hold) {
			mino_colour = c_white;
		}
		
		draw_sprite_ext(spr_mino, 0, xpos, ypos, scale, scale, 0, mino_colour, 1);
	}
}