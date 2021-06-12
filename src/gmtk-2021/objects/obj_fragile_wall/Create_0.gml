/// @description Insert description here
// You can write your code in this editor
var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, sprite_width / 2)
physics_fixture_set_density(fixture, 0);
physics_fixture_set_restitution(fixture, 0.1);
physics_fixture_set_friction(fixture, 0.2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

fMod = .75;  // i had to
hp = 3;
last_hit_time = current_time;
min_time_per_hit = 500;