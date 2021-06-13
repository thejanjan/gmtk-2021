/// @description Insert description here
// You can write your code in this editor
event_inherited();
if awake == 0 {
	draw_sprite_ext(sprite_index, 0, x, y, 2, 2, 0, c_white, 1);	
}
else {
	draw_sprite_ext(sprite_index, 20, x, y, 2, 2, 0, c_white, 1);
	draw_sprite_ext(sprite_index, t, x, y, 2, 2, 0, c_white, 1);	
}