var minox = argument0
var minoy = argument1

if(ds_grid_get(global.grid, minox, minoy) != c_white) {
	return true;
} else {
	return false;
}