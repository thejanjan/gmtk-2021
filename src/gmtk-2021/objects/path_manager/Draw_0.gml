/// @description Debug, draw path

draw_set_color(c_white);
for (var i = 0; i < array_length(TOTAL_PATH) - 1; i++) {
	draw_line_width(TOTAL_PATH[i][0], TOTAL_PATH[i][1], TOTAL_PATH[i + 1][0], TOTAL_PATH[i + 1][1], 20)
}