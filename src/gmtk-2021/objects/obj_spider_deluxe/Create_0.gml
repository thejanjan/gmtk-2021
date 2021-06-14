/// @description Insert description here
// You can write your code in this editor



var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, sprite_width);
physics_fixture_set_density(fixture, 0.8);
physics_fixture_set_restitution(fixture, 0.9);
physics_fixture_set_linear_damping(fixture, 0.6);
physics_fixture_set_angular_damping(fixture, 0.6);
physics_fixture_set_friction(fixture, 0.2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

instance_layer = layer;

enemy_set_starting_hp(120);

phy_linear_damping = 2;
phy_angular_damping = 10;
phy_active = false;
awake = 0;
t = 0;
image_speed = 0.5;

event_inherited();