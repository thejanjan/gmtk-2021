/// @description Insert description here
// You can write your code in this editor


timer++;
if timer = 60 instance_destroy();

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale,
				image_angle, image_blend, 1 - (timer / duration));

