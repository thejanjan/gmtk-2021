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
squash_factor = 0.75;
stretch_factor = 1.25;
hit_timer = 0;
image_speed = 0;
image_index = get_ball_image_index();
_angle = 0;
instance_layer = layer;
vanish_duration = 30;

weak = 0; // Weak is used for split balls
real_y = 0;
real_yspeed = 0;
real_gravity = 0.37;

init_current_velocity();