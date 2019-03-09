var tetromino = argument0;
var offset = argument1;

for(var i = 0; i < 4; i++) {
	var mino = tetromino[i]
	if(mino[0] > 9 || mino[0] < 0) {
		return true;
	}
	
	if(mino[1] > 21 || mino[1] < 0) {
		return true;
	}
	
	if(ds_grid_get(global.grid, mino[0] + offset[0], mino[1] + offset[1]) != c_white) {
		return true;
	}
}

return false;