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

// control next level timer stuff
if next_level_timer > 0 {
	var duration = 60;
	if place_meeting(x, y, obj_end_hole) {
		if obj_end_hole.image_index = 3 {
			next_level_timer--;
			if !audio_is_playing(snd_awful_laser) {
				audio_play_sound(snd_awful_laser, 0, true);
			}
		}
	} else next_level_timer = min(next_level_timer + 1, duration);
	if next_level_timer == 60 {
		audio_stop_sound(snd_awful_laser);
	}
	// Transition effects
	new_col = make_color_hsv(200, 255 * (1 - (next_level_timer / duration)), 255);
	image_blend = new_col;
	y_offset = -(1 - (next_level_timer / duration)) * 24;
	audio_sound_gain(snd_awful_laser, (2 - (next_level_timer / duration)), 0);
	with (obj_chain_link) {
		image_blend = obj_golf_kart.image_blend;
	}
	if instance_exists(obj_golfer) {
		obj_golfer.image_blend = new_col;
	}
} else {
	transition_timer++;
	if transition_timer = 1 {
		audio_sound_gain(snd_engine, 0, 1000);
		audio_stop_sound(snd_awful_laser);
		audio_play_sound(snd_snare, 0, false);
		image_alpha = 0; spawn_dandruff();
		with (obj_chain_link) {image_alpha = 0; spawn_dandruff();}
		with (obj_golfer) {image_alpha = 0; spawn_dandruff();}
		obj_golf_club.image_alpha = 0;
		physics_apply_impulse(x, y, random_range(-1, 1), random_range(-1, 1));
	}
	if sound != -1 audio_sound_pitch(sound, .65 + (transition_timer * pitch_factor * 2));  
	if transition_timer >= 59 {
		audio_stop_sound(snd_engine);
		audio_sound_gain(snd_engine, 1, 0);
		if transition_timer = 59 {
			transition_timer = 0;
			next_level_timer = 0;
			force_next_hole();
			instance_destroy();
		}
	}
	exit;
}

if controllable == 1 and not instance_exists(dummy) {
	var control_vector = [0, 0];
	if new_keyboard_check(global.binding_right) || new_keyboard_check(global.binding_right_arrow) {
		control_vector[0] += 1;
	}
	if new_keyboard_check(global.binding_left) || new_keyboard_check(global.binding_left_arrow) {
		control_vector[0] -= 1;
	}
	if new_keyboard_check(global.binding_up) || new_keyboard_check(global.binding_up_arrow) {
		control_vector[1] -= 1;
	}
	if new_keyboard_check(global.binding_down) || new_keyboard_check(global.binding_down_arrow) {
		control_vector[1] += 1;
	}
	control_vector = vector_normalize(control_vector); // Don't make the same mistake as Marble Blast...

	var acceleration_vector = vector_scale(control_vector, get_player_acceleration());
	physics_apply_impulse(x, y, acceleration_vector[0], acceleration_vector[1]);
}

// Only update the cart direction if it's moving significantly fast
// This stops it completely changing direction due to micro-adjustments in small numbers as it slows to a stop
if (abs(phy_speed_x) > 0.8 or abs(phy_speed_y) > 0.8 and keyboard_check(vk_anykey)) {
    current_direction = point_direction(x, y, x + phy_speed_x, y + phy_speed_y);
}

// phy_speed was annoying so screw it just do it live
// max speed probably needs adjusting
var max_speed = 8;
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

acceleration = 0.1;*/

// Draw trails actually jk
/*
if pspeed >= 40
{
	var shortangle = 90-0; // Turns out this sucked
	var longangle = 180-shortangle;
	var lowering = 22;
	var dis = 25;
	var dir = -phy_rotation+(shortangle/2);
	part_particles_create(trail_particle_system, x+lengthdir_x(dis, dir), y+lowering+lengthdir_y(dis, dir), trail_particle_type, 1);
	dir += longangle;
	part_particles_create(trail_particle_system, x+lengthdir_x(dis, dir), y+lowering+lengthdir_y(dis, dir), trail_particle_type, 1);
	dir += shortangle;
	part_particles_create(trail_particle_system, x+lengthdir_x(dis, dir), y+lowering+lengthdir_y(dis, dir), trail_particle_type, 1);
	dir += longangle;
	part_particles_create(trail_particle_system, x+lengthdir_x(dis, dir), y+lowering+lengthdir_y(dis, dir), trail_particle_type, 1);
};
if point_distance(0, 0, obj_golfer.phy_speed_x, obj_golfer.phy_speed_y) >= 8
{
    var lowering = 10;
    part_particles_create(hudson_dirt_face_particle_system, obj_golfer.x, obj_golfer.y+lowering, hudson_dirt_face_particle_type, 1);
    part_particles_create(deeper_hudson_dirt_face_particle_system, obj_golfer.x, obj_golfer.y+lowering, deeper_hudson_dirt_face_particle_type, 1);
}; */

if global.camera_shake > 0 {
	var xoffset = random_range(-global.camera_shake, global.camera_shake);
	var yoffset = random_range(-global.camera_shake, global.camera_shake);
	camera_set_view_pos(view_camera[0], x + xoffset, y + yoffset);
	global.camera_shake -= 1;
}