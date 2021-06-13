/// @description Insert description here
// You can write your code in this editor
event_inherited();
if awake == 0 {
	draw_sprite(sprite_index, 0, x, y);	
}
else {
	draw_sprite(sprite_index, 20, x, y);
	draw_sprite(sprite_index, t, x, y);	
}