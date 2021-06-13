// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function does_transition_exist() {
	return instance_exists(obj_top_transition);	
}

function make_new_transition() {
	if does_transition_exist() return;
	instance_create_layer(0, 0, "Instances", obj_top_transition);
}

function get_top_left_coords() {
	return [camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])]
}

function is_transition_ready() {
	if not does_transition_exist() return false;
	return obj_top_transition.ready
}

function transition_next_stage() {
	if not does_transition_exist() return;
	with (obj_top_transition) {
		timer = 0;
		mode = 1;
		ready = 0;
	}
}