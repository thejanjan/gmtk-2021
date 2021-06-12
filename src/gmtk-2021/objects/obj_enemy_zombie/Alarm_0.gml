/// @description update pathfinding

if target_ball == -1 or !instance_exists(target_ball) {
	target_ball = instance_find(obj_ball, irandom(instance_number(obj_ball) - 1));
}

if (current_state == state.idle or current_state == state.moving) and instance_exists(target_ball) and
  mp_grid_path(global.grid, path, phy_position_x, phy_position_y, target_ball.phy_com_x, target_ball.phy_com_y, 1) {
	current_state = state.moving;
	path_start(path, 1, path_action_stop, false);
}
else if current_state == state.well_fed and 
  mp_grid_path(global.grid, path, phy_position_x, phy_position_y, wander_to_x, wander_to_y, 1) {
	path_start(path, 1, path_action_stop, false);
  }
else if current_state != state.eating and current_state != state.dying {
	path_end();  // TODO: probably could make him wander a bit around while idle/trapped too
	current_state = state.idle;
}

alarm[0] = room_speed;