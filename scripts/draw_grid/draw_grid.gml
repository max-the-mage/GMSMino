var xpos;
var ypos;
var current_colour;

for(var xx = 0; xx < 10; xx++) {
	for(var yy = 0; yy < 22; yy++) {
		current_colour = ds_grid_get(global.grid, xx, yy);
		
		if(current_colour != c_white) {
			xpos = global.cell_origin_x + (global.cell_size * xx);
			ypos = global.cell_origin_y + (global.cell_size * yy);
			
			draw_sprite_ext(spr_mino, 0, xpos, ypos, global.grid_scale, global.grid_scale, 0, current_colour, 1);
		}
	}
}