// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.binding_up = ord("W");
global.binding_down = ord("S");
global.binding_right = ord("D");
global.binding_left = ord("A");
global.binding_up_arrow = vk_up;
global.binding_down_arrow = vk_down;
global.binding_right_arrow = vk_right;
global.binding_left_arrow = vk_left;
global.binding_debug = ord("P");
global.binding_debug_two = ord("L");
global.binding_toggle_trails = 187;
global.binding_toggle_trails_also = ord("T");

function new_keyboard_check_pressed(_code) {
	return keyboard_check_pressed(_code);
}

function new_keyboard_check_released(_code) {
	return keyboard_check_released(_code);
}

function new_keyboard_check(_code) {
	return keyboard_check(_code);
}

function new_keyboard_get_name(_code) {
	return _code;
}