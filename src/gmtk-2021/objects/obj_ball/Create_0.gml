/// @description set up physics properties

var fixture = physics_fixture_create();
physics_fixture_set_collision_group(fixture, collision_groups.never);
physics_fixture_set_circle_shape(fixture, 6);
physics_fixture_set_density(fixture, 0.8);
physics_fixture_set_restitution(fixture, 0.9);
physics_fixture_set_linear_damping(fixture, 0.6);
physics_fixture_set_angular_damping(fixture, 0.6);
physics_fixture_set_friction(fixture, 0.2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

impulse_force = 24;