/// @description Insert description here
// You can write your code in this editor
if new_keyboard_check(global.binding_right) || new_keyboard_check(global.binding_right_arrow) ||
	new_keyboard_check(global.binding_left) || new_keyboard_check(global.binding_left_arrow) ||
	new_keyboard_check(global.binding_up) || new_keyboard_check(global.binding_up_arrow) ||
	new_keyboard_check(global.binding_down) || new_keyboard_check(global.binding_down_arrow)
{
	show_keys = false;
};
if mouse_check_button_pressed(mb_left)
{
	show_mouse = false;	
}