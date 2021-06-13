/// @description eating animation

sprite_eating = current_state == state.eating ? !sprite_eating : false;
draw_sprite_ext(sprite_index, sprite_eating ? 1 : 0, phy_position_x - (sprite_width / 2), phy_position_y - (sprite_height / 2), 1, 1, phy_rotation, c_white, 1);
event_inherited();