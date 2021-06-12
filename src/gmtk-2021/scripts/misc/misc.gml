// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function hit_by_club() {
	if place_meeting(x, y, obj_golf_club)
	if obj_golf_club.swing
		return true
	return false
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