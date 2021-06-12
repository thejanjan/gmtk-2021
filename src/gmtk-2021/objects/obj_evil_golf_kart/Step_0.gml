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

var control_vector = [0, 0];
if new_keyboard_check(global.binding_right) {
	control_vector[0] += 1;
}
if new_keyboard_check(global.binding_left) {
	control_vector[0] -= 1;
}
if new_keyboard_check(global.binding_up) {
	control_vector[1] -= 1;
}
if new_keyboard_check(global.binding_down) {
	control_vector[1] += 1;
}
control_vector = vector_normalize(control_vector); // Don't make the same mistake as Marble Blast...

var acceleration_vector = vector_scale(control_vector, acceleration_magnitude);
physics_apply_impulse(x, y, acceleration_vector[0], acceleration_vector[1]);

// Only update the cart direction if it's moving significantly fast
// This stops it completely changing direction due to micro-adjustments in small numbers as it slows to a stop
if (abs(phy_speed_x) > 0.8 or abs(phy_speed_y) > 0.8 and keyboard_check(vk_anykey)) {
    current_direction = point_direction(x, y, x + phy_speed_x, y + phy_speed_y);
}

// phy_speed was annoying so screw it just do it live
// max speed probably needs adjusting
var pspeed = vector_magnitude_squared([phy_speed_x, phy_speed_y]);
var speed_percent = (pspeed / (max_speed * max_speed));
// audio
// if the sound failed to play initially, play it
if (sound == -1) {
	sound = audio_play_sound(snd_engine, 0, true);
}
audio_sound_pitch(sound, .65 + speed_percent * pitch_factor);  

/*
speed_range = [5, 8]
goal = [room_width / 2, room_height / 2];
vector_speed = [0, 0];
current_direction = point_direction(x, y, goal[0], goal[1]);

acceleration = 0.1;