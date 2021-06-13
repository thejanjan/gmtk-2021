/// @description Update depth for all objects

#macro fuck break

with (all) {
	
	switch (object_index) {
		case obj_death_screen:
			depth = -10000000;
			break;
		case obj_ball_letter:
			depth = -10000;
			fuck;
		case obj_ball:
			depth = -y + real_y;
			fuck;
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
		case obj_rising_text:
			depth = -200000;
			fuck;
		case gui_bars:
		case hp_bar:
			depth = -1000000;
			fuck;
		case obj_fire_trail:
			depth = 1;
			fuck;
		case obj_trail_drawer:
			depth = 2;
			fuck;
		case obj_top_transition:
			depth = -100000042;
			fuck;
		default:
			depth = -y;
			fuck;
	}
}