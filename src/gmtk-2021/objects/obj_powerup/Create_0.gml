/// @description BREAKFAST BY DEFAULT LOLOLOLOLOL
var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, sprite_width / 2)
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

image_speed = 0;
powerup_index = 3; // Look, it's breakfast.
image_index = powerup_index;
instance_layer = layer;