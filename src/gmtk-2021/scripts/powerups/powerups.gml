// Keeps access to all powerup attributes in one place.

global.player_damage_multiplier = 1.0;

function get_player_damage_multiplier() {
	return global.player_damage_multiplier;
}

function additive_increase_player_damage_multiplier(_amount) {
	global.player_damage_multiplier += _amount;
}