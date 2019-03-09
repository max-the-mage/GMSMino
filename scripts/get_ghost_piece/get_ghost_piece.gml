var ghost = grid_pos;
var piece;
for(var yy = ghost[1]; yy < 22; yy++) {
	ghost[1] = yy;
		
	piece = get_relative_minos(ghost, tetromino_type, rotation);
	
	if(check_collision(piece, [0, 1])) {		
		return piece;
	}
	
}
