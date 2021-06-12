/// @description Insert description here
// You can write your code in this editor

var min_speed_to_damage_enemy = 6;
if other.current_speed < min_speed_to_damage_enemy {
	hp_deal_damage(1);
} else {
	hp -= other.current_speed;
	if hp <= 0 {
		instance_destroy();
	}
}