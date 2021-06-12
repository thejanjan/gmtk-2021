/// @description initiate golf kart variables

function create_physics_link(_obj1, _obj2, _length) {
	_obj2.attachment_target = _obj1;
	physics_joint_rope_create(_obj1, _obj2, _obj1.x, _obj1.y, _obj2.x, _obj2.y, _length, true);
}

speed_range = [5, 8]
goal = [room_width / 2, room_height / 2];
velocity = [0, 0];
current_direction = point_direction(x, y, goal[0], goal[1]);

proposed_direction = current_direction;
lag_direction = current_direction;

//acceleration = 1;
acceleration_magnitude = 150;

turn_speed = 8;
max_speed = speed_range[0];

dir_goal = -1;
dir_goal_vector = [0, 0];
dir_vector = [0, 0];

// Set up cart's physics.
var half_sprite_width = sprite_width / 2;
var half_sprite_height = sprite_height / 2;

/*
var fixture = physics_fixture_create();
physics_fixture_set_box_shape(fixture, half_sprite_width / 2, half_sprite_height / 2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);
*/

var fixture = physics_fixture_create();
physics_fixture_set_collision_group(fixture, collision_groups.never);
physics_fixture_set_box_shape(fixture, half_sprite_width / 2, half_sprite_height / 2);
physics_fixture_set_density(fixture, 0.8);
physics_fixture_set_restitution(fixture, 0.9);
physics_fixture_set_linear_damping(fixture, 5);
physics_fixture_set_angular_damping(fixture, 0.6);
physics_fixture_set_friction(fixture, 0.2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

// Set up linked physics objects.
var chain_link_count = 4;
var chain_link_sprite_length = 40;
var golfer = instance_create_layer(x, y+chain_link_count*chain_link_sprite_length, layer, obj_golfer);
var chain_link;
for (var i=0; i<chain_link_count; i++) {
	chain_link[i] = instance_create_layer(x, y+half_sprite_height+i*chain_link_sprite_length, layer, obj_chain_link);
}
create_physics_link(id, chain_link[0], chain_link_sprite_length);
for (var i=1; i<chain_link_count; i++) {
	create_physics_link(chain_link[i], chain_link[i-1], chain_link_sprite_length);
}
if chain_link_count > 1 {
	chain_link[chain_link_count-1].attachment_target = chain_link[chain_link_count-2];
}
create_physics_link(chain_link[chain_link_count-1], golfer, chain_link_sprite_length);