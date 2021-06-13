/// @description Insert description here
// You can write your code in this editor
var fixture = physics_fixture_create();
// physics_fixture_set_box_shape(fixture, sprite_width / 2, sprite_height / 2);
physics_fixture_set_box_shape(fixture, (bbox_right - bbox_left) / 2, (bbox_bottom - bbox_top) / 2)
// physics_fixture_set_density(fixture, 0);
// physics_fixture_set_restitution(fixture, 0.1);
// physics_fixture_set_friction(fixture, 0.2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

image_xscale = choose(-1, 1);
depth = -y;
image_speed = 0;

if distance_to_object(obj_hole) < 120 or distance_to_object(obj_end_hole) < 120
	instance_destroy();