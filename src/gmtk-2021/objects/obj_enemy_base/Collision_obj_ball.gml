/// @description Insert description here
// You can write your code in this editor
var min_speed_for_damage = 2;
if other.current_speed > min_speed_for_damage {
	enemy_take_damage(get_ball_base_damage() + other.current_speed);
}