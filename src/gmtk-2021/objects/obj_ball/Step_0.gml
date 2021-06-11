/// @description physics controls
if mouse_check_button(mb_left) {
	var dir = point_direction(mouse_x, mouse_y, x, y);
	physics_apply_impulse(x, y, lengthdir_x(5, dir), lengthdir_y(5, dir));
}