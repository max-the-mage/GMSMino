var positions = argument0;
var colour = argument1;

for(var i = 0; i < 4; i++) {
	var currentpos = positions[i]
	
	ds_grid_set(global.grid, currentpos[0], currentpos[1], colour);
}