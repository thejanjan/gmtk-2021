/// @description Insert description here

if instance_exists(path_manager)
if distance_to_object_new(obj_golf_kart) < path_manager.GRACE_RADIUS {
	instance_destroy();
	exit;
}

// event_inherited();  // jk you can't unbind physics fixtures! lol!!!
previous_pos = [x, y];
current_pos = [x, y];
current_speed = 0;

var fixture = physics_fixture_create();
physics_fixture_set_collision_group(fixture, collision_groups.never);
physics_fixture_set_box_shape(fixture, sprite_width / 2, sprite_height / 2);
physics_fixture_set_density(fixture, 0.8);
physics_fixture_set_restitution(fixture, 0.9);
physics_fixture_set_linear_damping(fixture, 0.6);
physics_fixture_set_angular_damping(fixture, 2);
physics_fixture_set_friction(fixture, 0.4);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

enum state {
	idle,
	moving,
	physicsing,
	well_fed,
	eating,
	dying
}

sprite_eating = false;
current_state = state.idle;
target_ball = -4;
target_ball_xstart = 0;
target_ball_ystart = 0;
instance_layer = layer;

current_target_pos = [0, 0];
wander_to_x = 0;
wander_to_y = 0;

ball_too_big = 3;

lunch_start = -1;
lunch_duration = 2000;

enemy_set_starting_hp(30);