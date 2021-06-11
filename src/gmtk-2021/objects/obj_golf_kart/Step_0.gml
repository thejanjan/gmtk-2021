/// @description Directional logic, move to goal


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
current_direction = point_direction(x, y, x + velocity[0], y + velocity[1]);
x += velocity[0];
y += velocity[1];

/*
speed_range = [5, 8]
goal = [room_width / 2, room_height / 2];
vector_speed = [0, 0];
current_direction = point_direction(x, y, goal[0], goal[1]);

acceleration = 0.1;
