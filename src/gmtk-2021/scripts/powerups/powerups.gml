// Keeps access to all powerup attributes in one place.

global.player_damage_multiplier = 1.0;
global.player_max_speed = 8.0;

function get_player_damage_multiplier() {
	return global.player_damage_multiplier;
}

function additive_increase_player_damage_multiplier(_amount) {
	global.player_damage_multiplier += _amount;
}

function get_player_max_speed() {
	return global.player_max_speed;
}

function additive_increase_player_max_speed(_amount) {
	global.player_max_speed += _amount;
}

function collect_powerup(_powerup_index) {
	instance_destroy();
	apply_powerup(_powerup_index);
}

function apply_powerup(_powerup_index) {
	// Storing this data in JSON would be better, but we're short on time.
	switch _powerup_index {
		case 0:
			additive_increase_player_damage_multiplier(0.6);
			return;
		case 1:
			additive_increase_player_max_speed(4.0);
			return;
		default:
			show_message("WTF did you do??? AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
			return;
	}
}