/// @description Insert description here
// You can write your code in this editor
if flamming
{
	draw_sprite_ext(sprite_index, 1, x, y, flip?-1:1, 1, 0, c_white, 1);
	flip = not flip;
}
else
{
	draw_sprite(sprite_index, 0, x, y);	
}