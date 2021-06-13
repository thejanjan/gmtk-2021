/// @description BREAKFAST BY DEFAULT LOLOLOLOLOL
var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, sprite_width / 2)
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

powerup_index = 1; // Look, it's breakfast.