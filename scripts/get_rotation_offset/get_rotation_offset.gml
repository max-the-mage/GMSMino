var rotation_prev = argument0;
var rotation_curr = argument1;
var current = get_relative_minos(grid_pos, tetromino_type, rotation_curr);

if(tetromino_type == "O") {
	var o_offset = global.SRS_tests[? "O"];
	
	var offset = o_offset[rotation_curr];
	var offset_prev = o_offset[rotation_prev];
	
	offset_prev[0] -= offset[0];
	offset_prev[1] -= offset[1];
	
	return offset_prev;
}

if(tetromino_type == "I") {
	var set = global.SRS_tests[? "I"];
} else {
	var set = global.SRS_tests[? "other"];
}

for(var l = 0; l < 5; l++) {
	var prev = set[rotation_prev];
	var new = set[rotation_curr]
	
	var offset = prev[l];
	var offset_prev = new[l];
	
	offset[0] -= offset_prev[0];
	offset[1] -= offset_prev[1];
	
	if(!check_collision(current, offset)) {
		return offset;
	}
}

return undefined;
