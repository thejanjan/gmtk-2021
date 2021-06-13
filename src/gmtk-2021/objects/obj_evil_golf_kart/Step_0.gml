/// @description Directional logic, move to goal

/*
if mouse_check_button_pressed(mb_left) {
	goal[0] = mouse_x;
	goal[1] = mouse_y;
}

// Variable for direction
dir_vector = vector_heading_to([x, y], goal);

// Increment speed and
var old_velocity = velocity;
var vector_acceleration = vector_scale(dir_vector, acceleration);
velocity = vector_add(velocity, vector_acceleration);
if vector_magnitude(velocity) > max_speed
	velocity = old_velocity;

// Handle velocity logic
//x += velocity[0];
//y += velocity[1];
phy_speed_x = velocity[0];
phy_speed_y = velocity[1];

current_direction = point_direction(x, y, x + velocity[0], y + velocity[1]);
*/

event_inherited();

var from_instance;
if instance_exists(my_stinky_golfer) {
	from_instance = my_stinky_golfer;
} else {
	from_instance = self;
	// cleanup chains early if stinky golfer is dead
	for (var i = array_length(chain_link) - 1; i >= 0; i--) {
		if instance_exists(chain_link[i]) {
			with chain_link[i] {
				phy_active = false;
			}
		}
	}
}

var dir = vector_heading_to([from_instance.x, from_instance.y], [obj_golfer.x, obj_golfer.y]);
var acceleration_vector = vector_scale(dir, acceleration_magnitude);
physics_apply_impulse(x, y, acceleration_vector[0], acceleration_vector[1]);

// Only update the cart direction if it's moving significantly fast
// This stops it completely changing direction due to micro-adjustments in small numbers as it slows to a stop
if abs(phy_speed_x) > 0.8 or abs(phy_speed_y) > 0.8 {
    current_direction = point_direction(x, y, x + phy_speed_x, y + phy_speed_y);
}

/*
speed_range = [5, 8]
goal = [room_width / 2, room_height / 2];
vector_speed = [0, 0];
current_direction = point_direction(x, y, goal[0], goal[1]);

acceleration = 0.1;
