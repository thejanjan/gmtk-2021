// Keeps access to all powerup attributes in one place.

global.player_damage_multiplier = 1.0;
global.player_acceleration = 150.0;
global.golf_the_earth_damage = 0;
global.growth_spurt = 0;
global.explosive_hole_damage = 0;
global.player_fire_trails = 0;

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

function get_ball_image_index() {
	var result = global.growth_spurt;
	if global.golf_the_earth_damage > 0 {
		result += 12;
	}
	return result;
}

function get_ball_base_damage() {
	return 1 + global.growth_spurt * 3;
}

function get_ball_shadow_index() {
	var result = global.growth_spurt;
	return 6 + result;
}

function update_image_index_for_all_balls() {
	with(obj_ball) {
		image_index = get_ball_image_index();
	}
}

function additive_increase_golf_the_earth_damage(_amount) {
	global.golf_the_earth_damage += _amount;
	update_image_index_for_all_balls();
}

function create_aoe_damage(_vector_position, _radius, _amount) {
	with(obj_enemy_base) {
		if vector_distance([x, y], _vector_position) < _radius {
			enemy_take_damage(_amount);
		}
	}
}

function additive_increase_explosive_hole_damage(_amount) {
	global.explosive_hole_damage += _amount;
}

function get_explosive_hole_damage() {
	return global.explosive_hole_damage;
}

function additive_increase_growth_spurt(_amount) {
	global.growth_spurt = max(global.growth_spurt + _amount, 5);
	update_image_index_for_all_balls();
}

function additive_increase_player_fire_trails(_amount) {
	global.player_fire_trails += _amount;
}

function collect_powerup(_powerup_index) {
	//show_debug_message("Collected powerup " + string(_powerup_index));
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
			additive_increase_player_fire_trails(1);
			return;
		case 3:
			hp_increase_maxhp(1);
			return;
		case 4:
			additive_increase_golf_the_earth_damage(2);
			return;
		case 5:
			additive_increase_explosive_hole_damage(50);
			return;
		case 6:
			// Triple shot!
			return;
		case 7:
			// Magnet???
			return;
		case 8:
			// Growth spurt??? wtf?
			additive_increase_growth_spurt(1);
			return;
		default:
			show_message("WTF did you do??? AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
			return;
	}
}