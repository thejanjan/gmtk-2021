/// @description Insert description here

event_inherited();

if current_state == state.eating {
	if !instance_exists(target_ball) {
		current_state = state.idle;
		target_ball = -1;
		return;
	}
	instance_destroy(target_ball);
	if lunch_start == -1 {
		lunch_start = current_time;
	}
	else if current_time - lunch_start > lunch_duration {
		lunch_start = -1;
		current_state = state.well_fed;  // we want to get away from the ball if at its respawn point
		wander_to_x = irandom_range(max(x - 200, 0), min(x + 200, room_width));
		wander_to_y = irandom_range(max(y - 200, 0), min(y + 200, room_height));
		
		if instance_exists(target_ball) and instance_number(obj_ball) > 1 {
			instance_destroy(target_ball);
			target_ball = instance_find(obj_ball, irandom(instance_number(obj_ball) - 1));
		}
		else {
			// Respawn ball.
			instance_create_layer(target_ball_xstart, target_ball_ystart, instance_layer, obj_ball);
		}
	}
}
		
	
	