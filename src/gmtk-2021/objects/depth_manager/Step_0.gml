/// @description Update depth for all objects

#macro fuck break

with (all) {
	
	switch (object_index) {
		case obj_hole:
			depth = -y + 32;
			fuck;
		case obj_depth_hole:
			depth = -y + 200;
			fuck;
		case obj_end_hole:
			depth = -y - 300;
			fuck;
		case obj_golf_club:
			if instance_exists(obj_golfer) {
				depth = -obj_golfer.y - 100;
			}
			fuck;
		case gui_bars:
			depth = -100000;
			fuck;
		case hp_bar:
			depth = -100000;
			fuck;
		case obj_fire_trail:
			depth = 1;
			fuck;
		case obj_trail_drawer:
			depth = 2;
			fuck;
		default:
			depth = -y;
			fuck;
	}
}