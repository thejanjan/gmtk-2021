// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// new keyboard
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

// new text
function get_rising_text_val(_obj) {
	// Returns -1 if not a number
	if string_char_at(_obj.str, 1) != "-" return -1;
	try {
		var rising_text_str = _obj.str;
		var string_clip = string_delete(rising_text_str, 1, 1);
		if string_clip = string(real(string_clip))
			return real(string_clip);
	}
	return -1;
}

function draw_text_new(_x, _y, _string, _col, _outline_col, _scale, _kerning) {
	// Draws text using glyphs.
	
	// Step one: convert string to array.
	var str_len = string_length(_string);
	var str_array = array_create(str_len, -1);
	for (var i = 0; i < str_len; i++) {
		var char = string_lower(string_char_at(_string, i + 1));
		var index = -1;
		switch (char) {
			case "1":
				index = 0; fuck;
			case "2":
				index = 1; fuck;
			case "3":
				index = 2; fuck;
			case "4":
				index = 3; fuck;
			case "5":
				index = 4; fuck;
			case "6":
				index = 5; fuck;
			case "7":
				index = 6; fuck;
			case "8":
				index = 7; fuck;
			case "9":
				index = 8; fuck;
			case "0":
				index = 9; fuck;
			case "+":
				index = 10; fuck;
			case "-":
				index = 11; fuck;
			case "a":
				index = 12; fuck;
			case "b":
				index = 13; fuck;
			case "c":
				index = 14; fuck;
			case "d":
				index = 15; fuck;
			case "e":
				index = 16; fuck;
			case "f":
				index = 17; fuck;
			case "g":
				index = 18; fuck;
			case "h":
				index = 19; fuck;
			case "i":
				index = 20; fuck;
			case "j":
				index = 21; fuck;
			case "k":
				index = 22; fuck;
			case "l":
				index = 23; fuck;
			case "m":
				index = 24; fuck;
			case "n":
				index = 25; fuck;
			case "o":
				index = 26; fuck;
			case "p":
				index = 27; fuck;
			case "q":
				index = 28; fuck;
			case "r":
				index = 29; fuck;
			case "s":
				index = 30; fuck;
			case "t":
				index = 31; fuck;
			case "u":
				index = 32; fuck;
			case "v":
				index = 33; fuck;
			case "w":
				index = 34; fuck;
			case "x":
				index = 35; fuck;
			case "y":
				index = 36; fuck;
			case "z":
				index = 37; fuck;
			case "/":
				index = 38; fuck;
			case "@":
				index = 39; fuck;
			case "#":
				index = 40; fuck;
		}
		str_array[i] = index;
	}
	// Step two: draw the sprite.
	// var kerning = 48 * _scale;
	for (var i = 0; i < array_length(str_array); i++) {
		var __x = _x + (i * _kerning);
		var __y = _y;
		var offset = 4 * _scale;
		if str_array[i] = -1 continue;
		
		if str_array[i] != 39 and str_array[i] != 40 {
			draw_sprite_ext(glyph, str_array[i], __x-offset, __y+offset, _scale, _scale, 0, _outline_col, 1);
			draw_sprite_ext(glyph, str_array[i], __x-offset, __y+0, _scale, _scale, 0, _outline_col, 1);
			draw_sprite_ext(glyph, str_array[i], __x-offset, __y-offset, _scale, _scale, 0, _outline_col, 1);
			draw_sprite_ext(glyph, str_array[i], __x+0, __y+offset, _scale, _scale, 0, _outline_col, 1);
			draw_sprite_ext(glyph, str_array[i], __x+0, __y-offset, _scale, _scale, 0, _outline_col, 1);
			draw_sprite_ext(glyph, str_array[i], __x+offset, __y+offset, _scale, _scale, 0, _outline_col, 1);
			draw_sprite_ext(glyph, str_array[i], __x+offset, __y+0, _scale, _scale, 0, _outline_col, 1);
			draw_sprite_ext(glyph, str_array[i], __x+offset, __y-offset, _scale, _scale, 0, _outline_col, 1);
		}
		draw_sprite_ext(glyph, str_array[i], __x, __y, _scale, _scale, 0, _col, 1);
	}
}

function draw_text_new_centered(_x, _y, _string, _col, _outline_col, _scale, _kerning) {
	var str_len = string_length(_string);
	_x = _x - (str_len * _kerning * 0.5);
	draw_text_new(_x, _y, _string, _col, _outline_col, _scale, _kerning);
}