/// @description Initialize variables.
/// This is the base enemy. Inherit from it to define your own enemies.

var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, sprite_width / 2);
physics_fixture_set_density(fixture, 0.8);
physics_fixture_set_restitution(fixture, 0.9);
physics_fixture_set_linear_damping(fixture, 0.6);
physics_fixture_set_angular_damping(fixture, 0.6);
physics_fixture_set_friction(fixture, 0.2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

previous_pos = [x, y];
current_pos = [x, y];
current_speed = 0;

enemy_set_starting_hp(30);