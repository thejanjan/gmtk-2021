/// @description Insert description here
// You can write your code in this editor
current_velocity = vector_subtract(current_pos, previous_pos);
current_speed = vector_magnitude(current_velocity);
previous_pos = current_pos;
current_pos = [x, y];