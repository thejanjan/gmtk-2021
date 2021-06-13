/// @description Insert description here

event_inherited();

// Eating
if current_state == state.eating {
	// Haven't started eating yet
	if lunch_start == -1 {
		lunch_start = current_time;
		// if instance_exists(target_ball) {
			with (target_ball) instance_destroy();
		// }
	}
	// We have chewed enough
	else if current_time - lunch_start > lunch_duration {
		lunch_start = -1;
		current_state = state.well_fed;
		wander_to_x = irandom_range(max(x - 200, 0), min(x + 200, room_width));
		wander_to_y = irandom_range(max(y - 200, 0), min(y + 200, room_height));
		current_target_pos = [wander_to_x, wander_to_y];
		
		if instance_number(obj_ball) > instance_number(obj_hole) {
			target_ball = instance_find(obj_ball, irandom(instance_number(obj_ball) - 1));
		}
		else {
			// Respawn ball.
			instance_create_layer(target_ball_xstart, target_ball_ystart, instance_layer, obj_ball);
		}
	}
}
// Not eating and don't know where to go
else if !instance_exists(target_ball) {
	if instance_number(obj_ball) > 1 {
		target_ball = instance_find(obj_ball, irandom(instance_number(obj_ball) - 1));
		if instance_exists(target_ball) {
			target_ball_xstart = target_ball.xstart;
			target_ball_ystart = target_ball.ystart;
		}
	}
	/*} else {
		target_ball = instance_create_layer(target_ball_xstart, target_ball_ystart, instance_layer, obj_ball);
	}*/
	
}

// Heading to eat a ball
if (current_state == state.idle or current_state == state.moving) and instance_exists(target_ball)  and current_speed <= 8 {
	current_state = state.moving;
	current_target_pos = [target_ball.x, target_ball.y];
	var dir = vector_normalize(vector_heading_to([x, y], current_target_pos));
	var acceleration_vector = vector_scale(dir, 3);
	physics_apply_impulse(x, y, acceleration_vector[0], acceleration_vector[1]);
}
// Eaten recently and wandering
else if current_state == state.well_fed and current_speed <= 8 {
	var dir = vector_normalize(vector_heading_to([x, y], current_target_pos));
	var acceleration_vector = vector_scale(dir, 3);
	physics_apply_impulse(x, y, acceleration_vector[0], acceleration_vector[1]);
}
// Fallback
else if current_state != state.eating and current_state != state.dying {
	current_state = state.idle;
}

// Are we there yet??? Mom??????
if point_distance(x, y, current_target_pos[0], current_target_pos[1]) <= 32 {
	if current_state == state.well_fed {
		current_state = state.idle;
	}
	else if current_state == state.moving {
		current_state = state.eating;
	}
}
