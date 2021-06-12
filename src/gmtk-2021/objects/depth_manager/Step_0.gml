/// @description Update depth for all objects

#macro fuck break

with (all) {
	
	switch (object_index) {
		case obj_hole:
			depth = -y + 100;
			fuck;
		case obj_golf_club:
			depth = -obj_golfer.y - 100;
			fuck;
		case gui_bars:
			depth = -100000;
			fuck;
		default:
			depth = -y;
			fuck;
	}
}