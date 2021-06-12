/// @description Insert description here
// You can write your code in this editor
event_inherited();
if instance_exists(obj_golfer) {
	impulse_towards([obj_golfer.x, obj_golfer.y], 15);
}