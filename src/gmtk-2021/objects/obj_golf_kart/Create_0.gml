/// @description initiate golf kart variables

speed_range = [5, 8]
goal = [room_width / 2, room_height / 2];
vector_speed = [0, 0];
current_direction = point_direction(x, y, goal[0], goal[1]);

proposed_direction = current_direction;
lag_direction = current_direction;

acceleration = 1;

turn_speed = 8;
max_speed = speed_range[0];

dir_goal = -1;
dir_goal_vector = [0, 0];
dir_vector = [0, 0];