/// @description Track speed and other states
// You can write your code in this editor
current_speed = vector_magnitude(vector_subtract(current_pos, previous_pos));
previous_pos = current_pos;
current_pos = [x, y];

if hit_by_club() {
	var dir = vector_heading_to([obj_golfer.x, obj_golfer.y], [x, y]);
	club_apply_impulse(dir);
	//dir = vector_scale(dir, impulse_force);
	//physics_apply_impulse(x, y, dir[0], dir[1]);
}