// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function hit_by_club() {
	return /*place_meeting(x, y, obj_golf_club)*/(distance_to_point(obj_golf_club.x, obj_golf_club.y) < 100) && obj_golf_club.swing;
}

function club_apply_impulse(_vector_direction, _impulse_multiplier) {
	var base_impulse_force = 24 * _impulse_multiplier;
	
	//var raw_impulse = vector_scale(_vector_direction, base_impulse_force);
	//var impulse_from_golfer = obj_golfer.current_velocity;
	//var final_impulse = vector_add(raw_impulse, impulse_from_golfer);
	//physics_apply_impulse(x, y, final_impulse[0], final_impulse[1]);
	
	var impulse = vector_scale(_vector_direction, base_impulse_force + obj_golfer.current_speed);
	physics_apply_impulse(x, y, impulse[0], impulse[1]);
}

function nearest_active_hole() {
	// Try to find a non-flaming hole
	var nearest = 0;
	for (var i = 0; i < instance_number(obj_hole); i++) {
		if !instance_exists(obj_hole) break;
		var potential_hole = instance_nearest(x, y, obj_hole);
		if not potential_hole.flamming {
			nearest = potential_hole;
			break;
		}
		instance_deactivate_object(potential_hole);
	}
	// Re-activate each hole
	instance_activate_object(obj_hole);
	// Return our answer
	return nearest;
}

function enemy_take_damage(_amount) {
	hp -= _amount;
	if hp <= 0 {
		event_perform(ev_other, ev_user10);  // Execute before death, if we need
		instance_destroy();
	}
}

function enemy_set_starting_hp(_amount) {
	hp = _amount;
	hp_max = _amount;
}

function debug_string(_array) {
	var retstr = "";
	for (var i = 0; i < array_length(_array); i++) {
		retstr = retstr + string(_array[i]) + ", ";
	}
	clipboard_set_text(retstr);
	show_message(retstr);
}

enum GRASS {
	empty = 0,
	full_a = 1,
	full_b = 2,
	full_c = 3,
	up_left = 4,
	up_right = 5,
	down_left = 6,
	down_right = 7,
	only_left = 8,
	only_down_right = 9,
	only_down_left = 10,
	only_right = 11,
	only_down = 12,
	only_up_right = 13,
	only_up_left = 14,
	only_up = 15,
	left_right = 16,
	up_down = 17,
	blank_a = 18,
	blank_b = 19,
	up_left_b = 20,
	up_right_b = 21,
	down_right_c = 22,
	down_left_c = 23,
	down_left_b = 24,
	down_right_b = 25,
	up_right_c = 26,
	up_left_c = 27
}

/*function set_grass_tile_matrix(_tile_x, _tile_y, _map_id, _array) {
	// Sets all grass tiles around me.
	// Sets center to none, since that's what it will generally be.
	tilemap_set(_map_id, GRASS.empty, _tile_x, _tile_y);
	
	if _array[0] != -1 tilemap_set(_map_id, _array[0], _tile_x + 1, _tile_y + 0);
	if _array[0] != -1 tilemap_set(_map_id, _array[1], _tile_x + 1, _tile_y - 1);
	if _array[0] != -1 tilemap_set(_map_id, _array[2], _tile_x + 0, _tile_y - 1);
	if _array[0] != -1 tilemap_set(_map_id, _array[3], _tile_x - 1, _tile_y - 1);
	if _array[0] != -1 tilemap_set(_map_id, _array[4], _tile_x - 1, _tile_y + 0);
	if _array[0] != -1 tilemap_set(_map_id, _array[5], _tile_x - 1, _tile_y + 1);
	if _array[0] != -1 tilemap_set(_map_id, _array[6], _tile_x + 0, _tile_y + 1);
	if _array[0] != -1 tilemap_set(_map_id, _array[7], _tile_x + 1, _tile_y + 1);
}*/

function return_adjacent_grass_tiles(_tile_x, _tile_y, _map_id) {
	// Returns an array of 8, for each direction.
	// Right, up right, up, up left, left, down left, down, down right.
	return	   [sign(tilemap_get(_map_id, _tile_x + 1, _tile_y + 0)),
				sign(tilemap_get(_map_id, _tile_x + 1, _tile_y - 1)),
				sign(tilemap_get(_map_id, _tile_x + 0, _tile_y - 1)),
				sign(tilemap_get(_map_id, _tile_x - 1, _tile_y - 1)),
				sign(tilemap_get(_map_id, _tile_x - 1, _tile_y + 0)),
				sign(tilemap_get(_map_id, _tile_x - 1, _tile_y + 1)),
				sign(tilemap_get(_map_id, _tile_x + 0, _tile_y + 1)),
				sign(tilemap_get(_map_id, _tile_x + 1, _tile_y + 1))]
}

function grass_tile_update(_tile_x, _tile_y, _map_id) {
	// Updates this grass tile. Checks the adjacent ones, then operates accordingly.
	if not tilemap_get(_map_id, _tile_x, _tile_y) return;
	var a = return_adjacent_grass_tiles(_tile_x, _tile_y, _map_id);
	// debug_string(a);
	var result = -1;
	// Right, up right, up, up left, left, down left, down, down right.
		 if array_equals(a, [0, 1, 1, 1, 1, 1, 1, 1]) result = GRASS.only_left;
	else if array_equals(a, [0, 0, 1, 1, 1, 1, 1, 1]) result = GRASS.only_left;
	else if array_equals(a, [0, 1, 1, 1, 1, 1, 1, 0]) result = GRASS.only_left;
	else if array_equals(a, [0, 0, 1, 1, 1, 1, 1, 0]) result = GRASS.only_left;
	else if array_equals(a, [1, 0, 1, 1, 1, 1, 1, 0]) result = GRASS.only_left;
		 //////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [1, 0, 1, 1, 1, 1, 1, 1]) result = GRASS.down_left;
	//////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [1, 1, 0, 1, 1, 1, 1, 1]) result = GRASS.only_down;
	else if array_equals(a, [1, 0, 0, 1, 1, 1, 1, 1]) result = GRASS.only_down;
	else if array_equals(a, [1, 1, 0, 0, 1, 1, 1, 1]) result = GRASS.only_down;
	else if array_equals(a, [1, 0, 0, 0, 1, 1, 1, 1]) result = GRASS.only_down;
	else if array_equals(a, [1, 0, 1, 0, 1, 1, 1, 1]) result = GRASS.only_down;
	//////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [1, 1, 1, 0, 1, 1, 1, 1]) result = GRASS.down_right;
	//////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [1, 1, 1, 1, 0, 1, 1, 1]) result = GRASS.only_right;
	else if array_equals(a, [1, 1, 1, 0, 0, 1, 1, 1]) result = GRASS.only_right;
	else if array_equals(a, [1, 1, 1, 0, 0, 0, 1, 1]) result = GRASS.only_right;
	else if array_equals(a, [1, 1, 1, 1, 0, 0, 1, 1]) result = GRASS.only_right;
	else if array_equals(a, [1, 1, 1, 0, 1, 0, 1, 1]) result = GRASS.only_right;
	//////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [1, 1, 1, 1, 1, 0, 1, 1]) result = GRASS.up_right;
	//////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [1, 1, 1, 1, 1, 1, 0, 1]) result = GRASS.only_up;
	else if array_equals(a, [1, 1, 1, 1, 1, 1, 0, 0]) result = GRASS.only_up;
	else if array_equals(a, [1, 1, 1, 1, 1, 0, 0, 1]) result = GRASS.only_up;
	else if array_equals(a, [1, 1, 1, 1, 1, 0, 0, 0]) result = GRASS.only_up;
	else if array_equals(a, [1, 1, 1, 1, 1, 0, 1, 0]) result = GRASS.only_up;
	//////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [1, 1, 1, 1, 1, 1, 1, 0]) result = GRASS.up_left;
	//////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [1, 1, 1, 1, 0, 0, 0, 1]) result = GRASS.only_up_right;
	else if array_equals(a, [1, 1, 1, 1, 0, 0, 0, 0]) result = GRASS.only_up_right;
	else if array_equals(a, [1, 1, 1, 0, 0, 0, 0, 0]) result = GRASS.only_up_right;
	else if array_equals(a, [1, 1, 1, 0, 0, 0, 0, 1]) result = GRASS.only_up_right;
	//////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [0, 1, 1, 1, 1, 1, 0, 0]) result = GRASS.only_up_left;
	else if array_equals(a, [0, 0, 1, 1, 1, 1, 0, 0]) result = GRASS.only_up_left;
	else if array_equals(a, [0, 1, 1, 1, 1, 0, 0, 0]) result = GRASS.only_up_left;
	else if array_equals(a, [0, 0, 1, 1, 1, 0, 0, 0]) result = GRASS.only_up_left;
	//////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [0, 0, 0, 1, 1, 1, 1, 1]) result = GRASS.only_down_left;
	else if array_equals(a, [0, 0, 0, 1, 1, 1, 1, 0]) result = GRASS.only_down_left;
	else if array_equals(a, [0, 0, 0, 0, 1, 1, 1, 1]) result = GRASS.only_down_left;
	else if array_equals(a, [0, 0, 0, 0, 1, 1, 1, 0]) result = GRASS.only_down_left;
	else if array_equals(a, [0, 1, 0, 0, 1, 1, 1, 0]) result = GRASS.only_down_left;
	//////////////////////////////////////////////////////////////////////////
	else if array_equals(a, [1, 1, 0, 0, 0, 1, 1, 1]) result = GRASS.only_down_right;
	else if array_equals(a, [1, 0, 0, 0, 0, 1, 1, 1]) result = GRASS.only_down_right;
	else if array_equals(a, [1, 1, 0, 0, 0, 0, 1, 1]) result = GRASS.only_down_right;
	else if array_equals(a, [1, 0, 0, 0, 0, 0, 1, 1]) result = GRASS.only_down_right;
	//////////////////////////////////////////////////////////////////////////
	if not a[0] and not a[4] result = GRASS.empty;
	if not a[2] and not a[6] result = GRASS.empty;
	// Right, up right, up, up left, left, down left, down, down right.
	
	if result != 1 tilemap_set(_map_id, result, _tile_x, _tile_y);
}

function remove_grass_tile(_x, _y, _layer) {
	var TILE_WIDTH = [64, 48];
	var TX = floor(_x / TILE_WIDTH[0]);
	var TY = floor(_y / TILE_WIDTH[1]);
	
	var lay_id = layer_get_id(_layer);
	var map_id = layer_tilemap_get_id(lay_id);
	
	// var adjacent = return_adjacent_grass_tiles(TX, TY, map_id);
	tilemap_set(map_id, 0, TX, TY);
	grass_tile_update(TX + 1, TY + 1, map_id);
	grass_tile_update(TX + 1, TY + 0, map_id);
	grass_tile_update(TX + 1, TY - 1, map_id);
	grass_tile_update(TX - 1, TY + 1, map_id);
	grass_tile_update(TX - 1, TY + 0, map_id);
	grass_tile_update(TX - 1, TY - 1, map_id);
	grass_tile_update(TX + 0, TY - 1, map_id);
	grass_tile_update(TX + 0, TY + 1, map_id);
}

function remove_grass_tile_radius(_x, _y, _r, _layer) {
	var start_x = _x - _r;
	var start_y = _y - _r;
	var diameter = 2 * _r;
	var TILE_WIDTH = [64, 48];
	var x_steps = ceil(diameter / TILE_WIDTH[0]);
	var y_steps = ceil(diameter / TILE_WIDTH[1]);
	// Remove grass
	for (var i = 0; i < x_steps; i += 1) {
		for (var o = 0; o < y_steps; o += 1) {
			if vector_magnitude([(i - (x_steps / 2)) * 64, (o - (y_steps / 2)) * 48]) < _r
			remove_grass_tile(	start_x + (i * TILE_WIDTH[0]),
								start_y + (o * TILE_WIDTH[1]), _layer)
		}
	}
}

function regen_grass() {
	var map_ids = [layer_tilemap_get_id("layer_dark"), layer_tilemap_get_id("layer_light")]; 
	var TILE_WIDTH = [64, 48];
	var x_steps = ceil(room_width / TILE_WIDTH[0]);
	var y_steps = ceil(room_height / TILE_WIDTH[1]);
	
	for (var i = 0; i < x_steps; i += 1) {
		for (var o = 0; o < y_steps; o += 1) {
			tilemap_set(map_ids[0], choose(1, 2, 3), i, o);
			tilemap_set(map_ids[1], choose(1, 2, 3), i, o);
			if (i + o) mod 2 {
				// instance_create_layer(i * TILE_WIDTH[0], o * TILE_WIDTH[1], layer, obj_tree);
			}
		}
	}
}


function spawn_trees() {
	var map_id = layer_tilemap_get_id("layer_dark");
	var tile_mult = 1;
	var TILE_WIDTH = [64 * tile_mult, 48 * tile_mult];
	var x_steps = ceil(room_width / TILE_WIDTH[0]);
	var y_steps = ceil(room_height / TILE_WIDTH[1]);
	var flip = 0;
	for (var i = 0; i < x_steps; i += 1) {
		for (var o = 0; o < y_steps; o += 1) {
			// if (i + o) mod 2 continue;
			var tile_id = tilemap_get(map_id, i, o);
			var offset = [-1, -1];
			var move_amt = 120;
			var up_reduce = 0.5;
			switch (tile_id) {
				case 0:
				case 1:
				case 2:
				case 3:
				case GRASS.only_down_right:
				case GRASS.only_up_right:
				case GRASS.only_down_left:
				case GRASS.only_up_left:
					fuck;
				case GRASS.only_up:
					offset = [0, -move_amt * up_reduce]; fuck;
				case GRASS.only_down:
					offset = [0, move_amt]; fuck;
				case GRASS.only_left:
					offset = [-move_amt, 0]; fuck;
				case GRASS.only_right:
					offset = [move_amt, 0]; fuck;
				case GRASS.up_right:
					offset = [move_amt, -move_amt * up_reduce]; fuck;
				case GRASS.up_left:
					offset = [-move_amt, -move_amt * up_reduce]; fuck;
				case GRASS.down_left:
					offset = [-move_amt, move_amt]; fuck;
				case GRASS.down_right:
					offset = [move_amt, move_amt]; fuck;
				default:
					offset = [0, 0]; fuck;
			}
			if not array_equals(offset, [-1, -1]) {
				var amount = 24;
				var shuffle_pos = [choose(-1, 1) * irandom(amount), choose(-1, 1) * irandom(amount)];
				instance_create_layer((i * TILE_WIDTH[0]) + shuffle_pos[0] + offset[0], (o * TILE_WIDTH[1]) + shuffle_pos[1] + offset[1], layer, obj_tree);
			}
		}
	}
}