/// @description Determine who takes damage.
// You can write your code in this editor

var enemy_advantage = 3;
if other.current_speed < current_speed + enemy_advantage {
	// Damage player.
	hp_deal_damage(1);
} else {
	// Damage self.
	enemy_take_damage(other.current_speed * get_player_damage_multiplier());
	audio_play_sound(snd_enemy_smacked, 0, false);
}