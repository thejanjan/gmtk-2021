/// @description Draw powerup.
// You can write your code in this editor

var yoffset = round(8 * sin(0.01 * current_time));
draw_sprite(spr_ball, 4, x, y + yoffset);
draw_sprite(spr_powerup, powerup_index, x, y + yoffset);