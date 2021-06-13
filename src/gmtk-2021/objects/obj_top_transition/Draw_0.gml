depth = -42069100;

draw_set_color(c_black);

var _x = 0;
var _y = 0;
var _xgoal = 0;
ready = 0;
if mode = 0 {
	if timer < duration timer++;
	else ready = 1;
} else {
	if timer < duration timer++;
	else instance_destroy();
}
var corner_vec = get_top_left_coords();
if mode = 0 {
	_x = corner_vec[0] - view_wport[0] - (view_hport[0] / 2);
	_xgoal = corner_vec[0];
	
} else {
	_x = corner_vec[0]; 
	_xgoal = corner_vec[0] + view_wport[0] + (view_hport[0] / 2);
}
_x += (_xgoal - _x) * (timer / duration)
_y = corner_vec[1] - 1;
	
x = _x;
y = _y;
	
draw_rectangle(_x, _y, x + view_wport[0], y + view_hport[0], false);
draw_triangle(x + view_wport[0], _y, x + view_wport[0], y + view_hport[0], x + view_wport[0] + (view_hport[0] / 2), y + (view_hport[0] / 2), false);
draw_triangle(_x, _y, _x, y + (view_hport[0] / 2), _x - (view_hport[0] / 2), _y, 0);
draw_triangle(_x, _y + view_hport[0], _x, y + (view_hport[0] / 2), _x - (view_hport[0] / 2), _y + view_hport[0], 0);