var row = argument0;

var row_sum = 0;

	
for(var xx = 0; xx < 10; xx++) {
	if(ds_grid_get(global.grid, xx, row) != c_white) {
		row_sum++;
	}
}

if(row_sum == 10) {
	ds_grid_set_grid_region(global.grid, global.grid, 0, 0, 9, row-1, 0, 1);
	lines+=1;
	
	if(lines >= (level * 10) && level != 15) {
		level += 1;
	}
	
	grav = power(grav_multiplier, level)
}
