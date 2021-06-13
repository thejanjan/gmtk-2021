// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function hit_by_club() {
	return /*place_meeting(x, y, obj_golf_club)*/(distance_to_point(obj_golf_club.x, obj_golf_club.y) < 84) && obj_golf_club.swing;
}

function club_apply_impulse(_vector_direction, _impulse_multiplier) {
	var base_impulse_force = 24 * _impulse_multiplier;
	
	//var raw_impulse = vector_scale(_vector_direction, base_impulse_force);
	//var impulse_from_golfer = obj_golfer.current_velocity;
	//var final_impulse = vector_add(raw_impulse, impulse_from_golfer);
	//physics_apply_impulse(x, y, final_impulse[0], final_impulse[1]);
	
	var impulse = vector_scale(_vector_direction, base_impulse_force + obj_golfer.current_speed);
	physics_apply_impulse(x, y, impulse[0], impulse[1]);
	return obj_golfer.current_speed;
}

function nearest_active_hole() {
	// Try to find a non-flaming hole
	var count = instance_number(obj_hole);
	if count = 0 return;
	for (var i = 0; i < count; i++) {
		if !instance_exists(obj_hole) break;
		var potential_hole = instance_nearest(x, y, obj_hole);
		if instance_exists(potential_hole) {
			if not potential_hole.flamming 
				return potential_hole;
			instance_deactivate_object(potential_hole);
		}
	}
	// Re-activate each hole
	// if instance_exists(obj_hole)
		instance_activate_object(obj_hole);
	instance_activate_all();
	// Return our answer
	return noone;
}

function nearest_alive_enemy() {
	// Try to find an alive enemy
	var count = instance_number(obj_enemy_base);
	if count = 0 return;
	for (var i = 0; i < count; i++) {
		if !instance_exists(obj_enemy_base) break;
		var potential_enemy = instance_nearest(x, y, obj_enemy_base);
		if potential_enemy.hp > 0 
			return potential_enemy;
		instance_deactivate_object(potential_enemy);
	}
	// Re-activate each enemy
	// if instance_exists(potential_enemy)
	instance_activate_object(potential_enemy);
	instance_activate_all();
	// Return our answer
	return noone;
}