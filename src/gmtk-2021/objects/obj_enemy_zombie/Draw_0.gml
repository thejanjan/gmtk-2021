/// @description eating animation

var bounce_height = 10;
var bounce = bounce_height * abs(sin(0.01*current_time));
sprite_eating = current_state == state.eating ? !sprite_eating : false;
draw_sprite_ext(sprite_index, sprite_eating ? 1 : 0, phy_position_x, phy_position_y + bounce, 1 + bounce * 0.01, 1 - bounce * 0.01, 0, c_white, 1);
event_inherited();