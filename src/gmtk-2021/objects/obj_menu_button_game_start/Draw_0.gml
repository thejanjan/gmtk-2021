/// @description Insert description here
// You can write your code in this editor
var hover = position_meeting(mouse_x, mouse_y, self) ? .1 : 0;
draw_sprite_ext(sprite_index, 0, x, y, 1 + hover, 1 + hover, 0, c_white, 1);

if is_transition_ready() {
	transition_next_stage();
	room_goto(main_game);
}