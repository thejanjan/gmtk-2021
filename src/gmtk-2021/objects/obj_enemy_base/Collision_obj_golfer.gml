/// @description Determine who takes damage.
// You can write your code in this editor

if other.current_speed < current_speed {
	// Damage player.
	hp_deal_damage(1);
} else {
	// Damage self.
	hp -= other.current_speed * other.damage_multiplier;
	if hp <= 0 {
		instance_destroy();
	}
}