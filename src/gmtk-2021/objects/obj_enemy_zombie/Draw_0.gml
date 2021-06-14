/// @description eating animation

// shadow
draw_sprite_ext(sprite_index, 2, phy_position_x, phy_position_y, 1, 1, 0, c_white, 1);

// zambie
sprite_eating = false;
if current_state = state.eating sprite_eating = true;
var index = sprite_eating * (floor(get_timer() / 200000) mod 2);

var bounce_height = 10;
var bounce = bounce_height * abs(sin(0.0075*current_time));
var bounce2 = bounce_height * abs(cos((4 * pi / 3) + 0.0075*current_time));
if (global.golf_the_earth_damage > 0 and index = 1) index = 3;
if sprite_eating bounce2 *= 0.7;
draw_sprite_ext(sprite_index, index, phy_position_x, phy_position_y - (bounce2 * 2), 1 + bounce * 0.01, 1 - bounce * 0.01, 0, c_white, 1);
event_inherited();