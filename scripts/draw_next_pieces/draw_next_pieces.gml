var origin = [global.cell_origin_x + (global.cell_size * 11.25), global.cell_origin_y + (global.cell_size * 3)];
var xpos;
var ypos;
var scale = global.grid_scale *.75;
var cell_size = global.cell_size *.75;
if(update_queue) {
	var new_queue = ds_queue_create();
	ds_queue_copy(new_queue, piece_queue);
	for(var i = 0; i < 5; i++) {
		global.queue[i] = ds_queue_dequeue(new_queue);
	}
	
	update_queue = false;
}



for(var i = 0; i < 5; i++) {
	
	var tetromino = get_relative_minos([0, 0], global.queue[i], 0);
	var mino_colour = global.mino_colours[? global.queue[i]];
	
	for(var xx = 0; xx < 4; xx++) {
		
	var mino = tetromino[xx];
		xpos = origin[0] + (cell_size * mino[0]);
		ypos = origin[1] + (cell_size * mino[1]) + (cell_size * (3 * i));
		
		if(global.queue[i] != "I" && global.queue[i] != "O") {
			xpos += cell_size/2;
		}
		
		draw_sprite_ext(spr_mino, 0, xpos, ypos, scale, scale, 0, mino_colour, 1);
	}
}

