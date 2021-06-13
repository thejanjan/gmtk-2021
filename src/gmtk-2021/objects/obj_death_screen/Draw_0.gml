/// @description Insert description here
// You can write your code in this editor

var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

draw_set_color(c_black);
draw_set_alpha(0.4);
draw_rectangle(cx, cy, cx + view_wport[0], cy + view_hport[0], false);
draw_set_alpha(1);

cy += 230;

draw_text_new_centered(cx + (view_wport[0] / 2), cy + 40, "You could not handle golf 2", c_red, c_black, 1, 48 * 1)

timer++;

if timer > 180
draw_text_new_centered(cx + (view_wport[0] / 2), cy + 120, "But it is important that you tried", c_lime, c_black, 0.5, 48 * 0.5)

if timer > 300 {
	draw_text_new_centered(cx + (view_wport[0] / 2), cy + 180, "Well actually not really", c_red, c_black, 0.5, 48 * 0.5)
	draw_text_new_centered(cx + (view_wport[0] / 2), cy + 210, "because you failed", c_red, c_black, 0.5, 48 * 0.5)
}

if timer > 480 
	draw_text_new_centered(cx + (view_wport[0] / 2), cy + 270, "Press R to try again", c_white, c_black, 1, 48 * 1)
	
if keyboard_check_pressed(ord("R")) {
	make_new_transition()
} if is_transition_ready() {
	regenerate_holes();
	transition_next_stage()	
}