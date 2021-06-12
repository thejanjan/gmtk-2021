// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function impulse_towards(_vector_position, _movement_force) {
	var dir = vector_heading_to([x, y], [_vector_position[0], _vector_position[1]]);
	dir = vector_scale(dir, _movement_force);
	physics_apply_impulse(x, y, dir[0], dir[1]);
}