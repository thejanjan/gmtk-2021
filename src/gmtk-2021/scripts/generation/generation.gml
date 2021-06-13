// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function force_next_hole() {
	if instance_exists(path_manager) {
		if CURRENT_FLAGS < floor(path_manager.CURRENT_HOLE_COUNT)
			exit;
	}
	CURRENT_FLAGS = 0;
	with (all) {
		alive = 0;
		if persistent alive = 1;
		if object_index = path_manager alive = 0;
		if not alive instance_destroy();
	}
	instance_create_layer(0, 0, "Instances", path_manager);
}