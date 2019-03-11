/// @description Hold function
if(can_hold) {
	grid_update(current_mino.all_pos, c_white); // remove old mino from screen
	current_mino.active = false; // for next step iteration
	
	held = true; // tells creation script to grab the current piece from hold
}