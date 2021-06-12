/// @description initiate golf kart variables

speed_range = [5, 8]
goal = [room_width / 2, room_height / 2];
velocity = [0, 0];
current_direction = point_direction(x, y, goal[0], goal[1]);

proposed_direction = current_direction;
lag_direction = current_direction;

acceleration = 1;

turn_speed = 8;
max_speed = speed_range[0];

dir_goal = -1;
dir_goal_vector = [0, 0];
dir_vector = [0, 0];

// Set up cart's physics.
var fixture = physics_fixture_create();
physics_fixture_set_box_shape(fixture, sprite_width / 2, sprite_height / 2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

// Set up link with golfer.
var max_golfer_rope_length = 160;
var golfer = instance_create_layer(x, y+160, layer, obj_golfer);

physics_joint_rope_create(id, golfer, x, y, golfer.x, golfer.y, max_golfer_rope_length, true);