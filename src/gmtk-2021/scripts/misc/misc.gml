// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function hit_by_club() {
	return place_meeting(x, y, obj_golf_club) && obj_golf_club.swing;
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
	only_bottom = 12,
	only_top_right = 13,
	only_top_left = 14,
	only_top = 15,
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

function remove_grass_tile(_x, _y, _layer) {
	var TILE_WIDTH = [64, 48];
	var TILE_POS = [floor(_x / TILE_WIDTH[0]), floor(_y / TILE_WIDTH[1])]
	
	var lay_id = layer_get_id(_layer);
	var map_id = layer_tilemap_get_id(lay_id);
	var data = 0; //tilemap_get(map_id, 0, 0);
	tilemap_set(map_id, data, TILE_POS[0], TILE_POS[1]);
}