/// @description Determine who takes damage.
// You can write your code in this editor

if other.current_speed < current_speed {
	// Damage player.
	hp_deal_damage(1);
} else {
	// Damage self.
	enemy_take_damage(other.current_speed * get_player_damage_multiplier());
	audio_play_sound(snd_enemy_smacked, 0, false);
}