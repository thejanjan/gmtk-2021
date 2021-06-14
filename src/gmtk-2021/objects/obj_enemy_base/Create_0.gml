/// @description Initialize variables.
/// This is the base enemy. Inherit from it to define your own enemies.

if instance_exists(path_manager)
if distance_to_object_new(obj_golf_kart) < path_manager.GRACE_RADIUS {
	instance_destroy();
	exit;
}

event_inherited();

previous_pos = [x, y];
current_pos = [x, y];
current_speed = 0;
instance_layer = layer;

enemy_set_starting_hp(30);