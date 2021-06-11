/// @description Directional logic, move to goal


if mouse_check_button_pressed(mb_left) {
	goal[0] = mouse_x;
	goal[1] = mouse_y;
}

// Variables for direction
dir_goal = point_direction(x, y, goal[0], goal[1]);
dir_goal_vector = vector_make_from_direction(dir_goal);
dir_vector = vector_multiply(vector_add(dir_goal_vector, dir_vector), 0.5);

// Increment speed and
var old_vector_speed = vector_speed;
vector_speed = vector_add(vector_speed, vector_multiply(dir_vector, acceleration));
if vector_magnitude(vector_speed) > max_speed
	vector_speed = old_vector_speed;

// Handle speed logic
current_direction = point_direction(x, y, x + vector_speed[0], y + vector_speed[1]);
x += vector_speed[0];
y += vector_speed[1];

/*
speed_range = [5, 8]
goal = [room_width / 2, room_height / 2];
vector_speed = [0, 0];
current_direction = point_direction(x, y, goal[0], goal[1]);

acceleration = 0.1;
