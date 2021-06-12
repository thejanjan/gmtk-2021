/// @description Insert description here

if current_state == state.eating {
	// TODO: can still hit the ball during this state........
	// i just hope that, if that happens, the zombie dies at the same time!
	obj_ball.visible = false;
	if lunch_start == -1 {
		lunch_start = current_time;
	}
	else if current_time - lunch_start > lunch_duration {
		current_state = state.well_fed;  // we want to get away from the ball if at its respawn point
		wander_to_x = irandom(room_width);
		wanter_to_y = irandom(room_height);
		with(obj_ball) {
			event_perform(ev_other, ev_user0);  // respawn ball
		}
	}
}
		
	
	