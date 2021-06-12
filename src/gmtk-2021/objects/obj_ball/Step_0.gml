/// @description physics controls
if mouse_check_button(mb_left) {
	var dir = vector_heading_to([mouse_x, mouse_y], [x, y]);
	dir = vector_scale(dir, impulse_force);
	physics_apply_impulse(x, y, dir[0], dir[1]);
}

var hole = instance_nearest(x, y, obj_hole);
var distohole = point_distance(x, y, hole.x, hole.y);
if distohole < 15
{
	var dir = vector_heading_to([x, y], [hole.x, hole.y]);
	dir = vector_scale(dir, 2);
	physics_apply_impulse(x, y, dir[0], dir[1]);
	phy_speed_y /= 1+0.5*(1-(distohole/15));
	phy_speed_y /= 1+0.5*(1-(distohole/15));
};