/// @description Insert description here
// You can write your code in this editor
if flamming
{
	draw_sprite_ext(sprite_index, 1, x, y, flip?-1:1, 1, 0, c_white, 1);
	if irandom_range(1,5) == 5
		flip = not flip;
	for (var i=1; i<10; i++)
	{
		draw_sprite_ext(sprite_index, 2, x, y-64*i, flip?-1:1, 1, 0, c_white, 1);
	}
}
else
{
	draw_sprite(sprite_index, 0, x, y);	
}