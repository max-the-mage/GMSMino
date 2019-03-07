var origin = argument0;
var mino_type = argument1;

var xpos = origin[0]
var ypos = origin[1]

var mino_array;


switch(mino_type) {
	case "I":
		return [[xpos, ypos], [xpos-1, ypos], [xpos+1, ypos], [xpos+2, ypos]];
	case "J":
		return [[xpos, ypos], [xpos-1, ypos], [xpos-1, ypos-1], [xpos+1, ypos]];
	case "L":
		return [[xpos, ypos], [xpos-1, ypos], [xpos+1, ypos], [xpos+1, ypos-1]]
}