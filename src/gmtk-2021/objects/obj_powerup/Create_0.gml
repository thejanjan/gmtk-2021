/// @description BREAKFAST BY DEFAULT LOLOLOLOLOL
var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, sprite_width / 2)
//physics_fixture_set_density(fixture, 0);
//physics_fixture_set_restitution(fixture, 0.1);
//physics_fixture_set_friction(fixture, 0.2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

powerup_index = 0; // Look, it's breakfast.