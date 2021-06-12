/// @description Debug, draw path

draw_set_color(c_white);
for (var i = 0; i < array_length(TOTAL_PATH) - 1; i++) {
	draw_set_color(make_color_hsv((i * 16) mod 256, 255, 255));
	draw_line_width(TOTAL_PATH[i][0], TOTAL_PATH[i][1], TOTAL_PATH[i + 1][0], TOTAL_PATH[i + 1][1], 5)
}

draw_circle_color(START_VECTOR[0], START_VECTOR[1], 30, c_lime, c_white, false);
draw_circle_color(GOAL_VECTOR[0], GOAL_VECTOR[1], 30, c_red, c_white, false);

if new_keyboard_check_pressed(global.binding_debug_two) room_restart();