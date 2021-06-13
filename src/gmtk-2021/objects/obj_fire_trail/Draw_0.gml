/// @description Insert description here
// You can write your code in this editor


timer++;
if timer = 60 instance_destroy();

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale,
				image_angle, image_blend, 1 - (timer / duration));


if !instance_exists(obj_enemy_base) exit;

var near_enemy = instance_nearest(x, y, obj_enemy_base);
if distance_to_object(near_enemy) <= 1 {
	// stuff	
}
