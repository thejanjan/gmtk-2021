/// @description Insert description here
// You can write your code in this editor
event_inherited();
if !instance_exists(obj_golfer) exit;
if instance_exists(path_manager)
	if distance_to_object(obj_golfer) > path_manager.ENEMY_VISION exit;
if instance_exists(obj_golfer) {
	impulse_towards([obj_golfer.x, obj_golfer.y], 15);
}