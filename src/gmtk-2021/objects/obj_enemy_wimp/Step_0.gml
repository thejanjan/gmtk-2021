/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_golfer) {
	var movement_force = 15;
	var dir = vector_heading_to([x, y], [obj_golfer.x, obj_golfer.y]);
	dir = vector_scale(dir, movement_force);
	physics_apply_impulse(x, y, dir[0], dir[1]);
}