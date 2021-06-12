/// @description Destroy self if the golfer is moving fast enough.
// You can write your code in this editor
if other.current_speed > 10 {
	instance_destroy();
}
else if other.current_speed > 5 * fMod and current_time - last_hit_time >= min_time_per_hit {
	hp -= 1;
	last_hit_time = current_time;
	if hp <= 0 {
		instance_destroy();
	}
}