/// @description Initialize variables.
/// This is the base enemy. Inherit from it to define your own enemies.

if instance_exists(path_manager)
if distance_to_object_new(obj_golf_kart) < path_manager.GRACE_RADIUS {
	instance_destroy();
	exit;
}

previous_pos = [x, y];
current_pos = [x, y];
current_speed = 0;
instance_layer = layer;

hit_by_ball_cooldown = 10;

enemy_set_starting_hp(30);