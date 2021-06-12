/// @description physics controls
if mouse_check_button(mb_left) {
	var dir = vector_heading_to([mouse_x, mouse_y], [x, y]);
	dir = vector_scale(dir, impulse_force);
	physics_apply_impulse(x, y, dir[0], dir[1]);
}