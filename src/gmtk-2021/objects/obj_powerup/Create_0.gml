/// @description BREAKFAST BY DEFAULT LOLOLOLOLOL
var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, sprite_width / 2)
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

image_speed = 0; // Image index corresponds to powerup type.
image_index = 2; // Look, it's breakfast.