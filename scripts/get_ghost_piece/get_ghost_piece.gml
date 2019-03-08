var ghost = grid_pos;
var piece;
for(var yy = 21; yy > 0; yy++) {
	if(!check_collision(all_pos, [0, yy - grid_pos[1]]) ) {	
		ghost[1] = yy;
		
		piece = get_relative_minos(ghost, tetromino_type, rotation);
	}
}

return piece;