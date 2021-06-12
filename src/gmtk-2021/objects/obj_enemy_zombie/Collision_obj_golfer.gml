/// @description die if hit by golfer fast
if other.current_speed > 10 {
	if current_state == state.eating {
		with(obj_ball) {
			obj_ball.visible = true;
		}
	}
	current_state = state.dying;  // TODO: death anim!!
	instance_destroy();
}
else if other.current_speed > 5 * fMod and current_time - last_hit_time >= min_time_per_hit {
	hp -= 1;
	last_hit_time = current_time;
	if hp <= 0 {
		if current_state == state.eating {
			with(obj_ball) {
				obj_ball.visible = true;
			}
		}
		instance_destroy();
	}
}