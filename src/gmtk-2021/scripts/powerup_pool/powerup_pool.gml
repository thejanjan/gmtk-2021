// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.powerup_pool_list = ds_list_create();

function add_powerup_to_pool(_powerup_index, _count) {
	for (var i=0; i<_count; i++) {
		ds_list_add(global.powerup_pool_list, _powerup_index);
	}
}

function reset_powerup_pool() {
	ds_list_clear(global.powerup_pool_list);
	add_powerup_to_pool(0, 3);
	add_powerup_to_pool(1, 3);
	add_powerup_to_pool(2, 5);
	add_powerup_to_pool(3, 3);
	add_powerup_to_pool(4, 3);
	add_powerup_to_pool(5, 2);
	add_powerup_to_pool(6, 4);
	add_powerup_to_pool(7, 3);
	add_powerup_to_pool(8, 5);
	ds_list_shuffle(global.powerup_pool_list);
}

function get_pool_powerup() {
	var list_size = ds_list_size(global.powerup_pool_list);
	if list_size > 0 {
		var list_index = irandom(list_size-1);
		var powerup_index = ds_list_find_value(global.powerup_pool_list, list_index);
		ds_list_delete(global.powerup_pool_list, list_index);
		return powerup_index;
	} else {
		// The pool is depleted, so choose a powerup that can just be picked up infinitely.
		return choose(0, 1, 4, 5);
	}
}