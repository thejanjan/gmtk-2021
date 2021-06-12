/// @description physics controls

var hole = nearest_active_hole();

if hit_by_club() {
	var dir = vector_heading_to([obj_golfer.x, obj_golfer.y], [x, y]);
	if hole {
		var nearest_hole = instance_nearest(x, y, obj_hole);
		dir = vector_heading_to([x, y], [nearest_hole.x, nearest_hole.y]);
	}
	club_apply_impulse(dir);
	//dir = vector_scale(dir, impulse_force);
	//physics_apply_impulse(x, y, dir[0], dir[1]);
}

if not hole exit;

var distohole = point_distance(x, y, hole.x, hole.y);
if distohole < 7
{
    instance_destroy();
    hole.flamming = true;
}
else if distohole < 15
{
	var dir = vector_heading_to([x, y], [hole.x, hole.y]);
	dir = vector_scale(dir, 2);
	physics_apply_impulse(x, y, dir[0], dir[1]);
	phy_speed_y /= 1+0.5*(1-(distohole/15));
	phy_speed_y /= 1+0.5*(1-(distohole/15));
};