// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function debug_string(_array) {
	var retstr = "";
	for (var i = 0; i < array_length(_array); i++) {
		retstr = retstr + string(_array[i]) + ", ";
	}
	clipboard_set_text(retstr);
	show_message(retstr);
}

function make_surface_dimensions() {
	return [power(2, ceil(log2(room_width))), power(2, ceil(log2(room_height)))];
}

function spawn_dandruff() {
	flake_size = 12;
	flake_chance = 0.25;
	for (var i = 0; i < sprite_width / flake_size; i++) {
		for (var o = 0; o < sprite_height / flake_size; o++) {
			if random(1) < flake_chance {
				instance_create_layer(x - sprite_get_xoffset(sprite_index) + (i * flake_size), y - sprite_get_yoffset(sprite_index) + (o * flake_size), "Instances", obj_flake)
			}
		}
	}
}
