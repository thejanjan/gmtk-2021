/// @description Insert description here
// You can write your code in this editor
var fixture = physics_fixture_create();
physics_fixture_set_collision_group(fixture, collision_groups.never);

physics_fixture_set_polygon_shape(fixture);
physics_fixture_add_point(fixture,  0, -12);
physics_fixture_add_point(fixture,  8,  0 );
physics_fixture_add_point(fixture,  0,  12);
physics_fixture_add_point(fixture, -8,  0 );


physics_fixture_set_density(fixture, 0.8);
physics_fixture_set_restitution(fixture, 0.9);
physics_fixture_set_linear_damping(fixture, 0.6);
physics_fixture_set_angular_damping(fixture, 0.6);
physics_fixture_set_friction(fixture, 0.2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

attachment_target = -1;