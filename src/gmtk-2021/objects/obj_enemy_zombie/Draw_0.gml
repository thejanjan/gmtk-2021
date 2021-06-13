/// @description eating animation

var bounce_height = 10;
var bounce = bounce_height * abs(sin(0.01*current_time));
sprite_eating = false;
if current_state = state.eating sprite_eating = true;
var index = sprite_eating * (floor(get_timer() / 200000) mod 2);
draw_sprite_ext(sprite_index, index, phy_position_x, phy_position_y + bounce, 1 + bounce * 0.01, 1 - bounce * 0.01, 0, c_white, 1);
event_inherited();