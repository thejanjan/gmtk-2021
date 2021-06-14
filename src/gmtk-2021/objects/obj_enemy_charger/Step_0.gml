/// @description Insert description here
// You can write your code in this editor
event_inherited();
if !instance_exists(obj_golfer) exit;
if instance_exists(path_manager)
	if distance_to_object_new(obj_golfer) > path_manager.ENEMY_VISION exit;
if instance_exists(obj_golfer) {
	var impulse;
	if current_state == charger_state.charging {
		impulse = 200;
	} else {
		impulse = 25;
	}
	impulse_towards([obj_golfer.x, obj_golfer.y], impulse);
}