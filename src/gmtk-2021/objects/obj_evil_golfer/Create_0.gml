/// @description Set up physics
// You can write your code in this editor

var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, 6);
physics_fixture_set_density(fixture, 0.8);
physics_fixture_set_restitution(fixture, 0.9);
physics_fixture_set_linear_damping(fixture, 0.6);
physics_fixture_set_angular_damping(fixture, 1.0);
physics_fixture_set_friction(fixture, 0.001);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

attachment_target = -1;
instance_layer = layer;

//club = instance_create_layer(x, y, layer, obj_golf_club);
facing = image_angle;

enemy_set_starting_hp(20);

event_inherited();