/// @description Insert description here

var fixture = physics_fixture_create();
physics_fixture_set_box_shape(fixture, sprite_width / 2, sprite_height / 2);
physics_fixture_set_collision_group(fixture, collision_groups.never);
physics_fixture_set_density(fixture, 0);
physics_fixture_set_restitution(fixture, 0.1);
physics_fixture_set_friction(fixture, 0.2);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

enum state {
	idle,
	moving,
	well_fed,
	eating,
	dying
}

current_state = state.idle;

path = path_add();
alarm[0] = room_speed;
wander_to_x = 0;
wander_to_y = 0;

lunch_start = -1;
lunch_duration = 2000;

fMod = .75;  // i had to
hp = 3;
last_hit_time = current_time;
min_time_per_hit = 200;