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

function camera_make(_size) {
	// Builds the camera at the kart.
	if !instance_exists(obj_golf_kart) exit;
	with (obj_golf_kart) {
		camera_destroy(view_camera[0]);
		var k = camera_obj;
		var v = _size; // [view_wport[0], view_hport[0]];
		if _size[0] = -1 or _size[1] = -1
			v = [window_get_width(), window_get_height()];
		if instance_exists(dummy) k = dummy;
		view_camera[0] = camera_create_view(k.x - (v[0] / 2), k.y - (v[1] / 2), v[0], v[1], 0, k, -1, -1, v[0] / 2, v[1] / 2);
		camera_set_view_target(view_camera[0], camera_obj);
		if instance_exists(dummy) camera_set_view_target(view_camera[0], dummy);
		camera_set_default(view_camera[0]);
		camera_apply(view_camera[0]);
		view_set_camera(0, view_camera[0]);	
		
		surface_resize(application_surface, v[0], v[1]);
	}
}

function distance_to_object_new(_obj) {
	// Clean version of distance_to_object.	
	// Will return infinite if instance does not exist (the distance is too great).
	if !instance_exists(_obj) return infinity;
	return distance_to_object(_obj);
}
