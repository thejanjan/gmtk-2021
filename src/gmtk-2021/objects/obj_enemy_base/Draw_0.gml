/// @description Insert description here
// You can write your code in this editor
if hp < hp_max {
	draw_healthbar(x-sprite_width/2, y+sprite_height/2+4, x+sprite_width/2, y+sprite_height/2+16,
		hp * 100 / hp_max, c_dkgray, c_green, c_red, 0, 1, 1);
}