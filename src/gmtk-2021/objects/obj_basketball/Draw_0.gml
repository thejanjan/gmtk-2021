/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_drone_shadow, 0, x, y);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, -phy_speed_x * 5, c_white, image_alpha);
event_inherited();