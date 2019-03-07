var origin = argument0;
var mino_type = argument1;
var rotation = argument2;

var xpos = origin[0]
var ypos = origin[1]

var full_mino = global.rotation_data[? mino_type];
var rotated_mino = full_mino[rotation];
var mino_array = [[0, 0], [0, 0], [0, 0], [0, 0]];

for(var i = 0; i < 4; i++) {
	var mino = rotated_mino[i];
	var new_mino = mino_array[i];
	
	new_mino[0] = xpos + mino[0];
	new_mino[1] = ypos + mino[1];
	
	mino_array[i] = new_mino;
}

return mino_array;
	