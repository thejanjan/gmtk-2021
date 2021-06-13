// Keeps access to all powerup attributes in one place.

global.player_damage_multiplier = 1.0;
global.player_acceleration = 150.0;
global.golf_the_earth_damage = 0;
global.explosive_holes = false;
global.player_fire_trails = 1;

function get_player_damage_multiplier() {
	return global.player_damage_multiplier;
}

function additive_increase_player_damage_multiplier(_amount) {
	global.player_damage_multiplier += _amount;
}

function get_player_acceleration() {
	return global.player_acceleration;
}

function additive_increase_player_acceleration(_amount) {
	global.player_acceleration += _amount;
}

function get_golf_the_earth_damage() {
	return global.golf_the_earth_damage;
}

function additive_increase_golf_the_earth_damage(_amount) {
	if global.golf_the_earth_damage == 0 {
		with(obj_ball) {
			image_index += 12;
		}
	}
	global.golf_the_earth_damage += _amount;
}

function create_aoe_damage(_vector_position, _radius, _amount) {
	with(obj_enemy_base) {
		if vector_distance([x, y], _vector_position) < _radius {
			enemy_take_damage(_amount);
		}
	}
function additive_increase_player_fire_trails(_amount) {
	global.player_fire_trails += _amount;
}

function collect_powerup(_powerup_index) {
	show_debug_message("Collected powerup " + string(_powerup_index));
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
			additive_increase_player_acceleration(75.0);
			return;
		case 2:
			// Chili pepper?
			return;
		case 3:
			hp_increase_maxhp(1);
			return;
		case 4:
			additive_increase_golf_the_earth_damage(2);
			return;
		case 5:
			// Explosive holes.
			return;
		case 6:
			// Triple shot!
			return;
		case 7:
			// Magnet???
			return;
		case 8:
			// Growth spurt??? wtf?
			return;
		default:
			show_message("WTF did you do??? AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
			return;
	}
}