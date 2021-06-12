/// @description Track speed and other states
// You can write your code in this editor
current_speed = vector_magnitude(vector_subtract(current_pos, previous_pos));
previous_pos = current_pos;
current_pos = [x, y];

if hit_by_club() {
	//show_debug_message("Enemy hit by club at " + string(current_time));
	
	var dir = vector_heading_to([obj_golfer.x, obj_golfer.y], [x, y]);
	club_apply_impulse(dir, 70.0);
	
	var base_damage = obj_golfer.current_speed + obj_golfer.club_base_damage;
	enemy_take_damage(base_damage * obj_golfer.damage_multiplier);
}