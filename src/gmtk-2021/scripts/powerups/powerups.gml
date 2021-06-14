// Keeps access to all powerup attributes in one place.

global.player_damage_multiplier = 1.0;
global.player_acceleration = 150.0;
global.golf_the_earth_damage = 0;
global.growth_spurt = 0;
global.explosive_hole_damage = 0;
global.player_fire_trails = 0;
global.magnet_power = 0;
global.additional_shots = 0;

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
	global.growth_spurt = min(global.growth_spurt + _amount, 5);
	update_image_index_for_all_balls();
}

function additive_increase_player_fire_trails(_amount) {
	global.player_fire_trails += _amount;
}

function additive_increase_magnet_power(_amount) {
	global.magnet_power += _amount;
}

function additive_increase_additional_shots(_amount) {
	global.additional_shots += _amount;
}

function collect_powerup(_powerup_index) {
	//show_debug_message("Collected powerup " + string(_powerup_index));
	instance_destroy();
	var a = instance_create_layer(x, y, instance_layer, obj_grow_fade);
	a.sprite_index = spr_ball;
	a.image_index = 4;
	var b = instance_create_layer(x, y, instance_layer, obj_grow_fade);
	b.sprite_index = spr_powerup;
	b.image_index = _powerup_index;
	var text = instance_create_layer(x, y, instance_layer, obj_rising_text);
	text.str = get_powerup_name(_powerup_index);
	text.col = c_blue;
	audio_play_sound(snd_powerup, 0, false);
	apply_powerup(_powerup_index);
}

function apply_powerup(_powerup_index) {
	// Storing this data in JSON would be better, but we're short on time.
	switch _powerup_index {
		case 0:
			additive_increase_player_damage_multiplier(0.6);
			return;
		case 1:
			additive_increase_player_acceleration(35.0);
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
			additive_increase_additional_shots(1);
			return;
		case 7:
			additive_increase_magnet_power(1);
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

function get_powerup_name(_powerup_index) {
	switch _powerup_index {
		case 0: return "DAMAGE UP";
		case 1: return "SPEED UP";
		case 2: return "FLAMING HOT";
		case 3: return "HEALTH UP";
		case 4: return "GOLF THE EARTH";
		case 5: return "EXPLOSIVE HOLE";
		case 6: return "+1 SHOT";
		case 7: return "MAGNET POWER UP";
		case 8: return "GROWTH SPURT";
		default: return "WTF??? HUH??? HOW?!?!?! DON'T!!!";
	}
}

// Powerup pool info
global.powerup_pool_list = ds_list_create();

function add_powerup_to_pool(_powerup_index, _count) {
	for (var i=0; i<_count; i++) {
		ds_list_add(global.powerup_pool_list, _powerup_index);
	}
}

function reset_powerup_pool() {
	ds_list_clear(global.powerup_pool_list);
	add_powerup_to_pool(0, 3);
	add_powerup_to_pool(1, 3);
	add_powerup_to_pool(2, 5);
	add_powerup_to_pool(3, 3);
	add_powerup_to_pool(4, 3);
	add_powerup_to_pool(5, 2);
	add_powerup_to_pool(6, 4);
	add_powerup_to_pool(7, 3);
	add_powerup_to_pool(8, 5);
	ds_list_shuffle(global.powerup_pool_list);
}

function get_pool_powerup() {
	var list_size = ds_list_size(global.powerup_pool_list);
	if list_size > 0 {
		var list_index = irandom(list_size-1);
		var powerup_index = ds_list_find_value(global.powerup_pool_list, list_index);
		ds_list_delete(global.powerup_pool_list, list_index);
		return powerup_index;
	} else {
		// The pool is depleted, so choose a powerup that can just be picked up infinitely.
		return choose(0, 1, 4, 5);
	}
}

apply_powerup(4);
apply_powerup(4);
apply_powerup(4);
