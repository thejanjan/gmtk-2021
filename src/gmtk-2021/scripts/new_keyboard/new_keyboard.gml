// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

binding_up = ord("W");
binding_down = ord("S");
binding_right = ord("D");
binding_left = ord("A");

function new_keyboard_check_pressed(_code) {
	return keyboard_check_pressed(_code);
}

function new_keyboard_check_released(_code) {
	return keyboard_check_released(_code);
}

function new_keyboard_check(_code) {
	return keyboard_check(_code);
}