// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function split_into_random_summands(_sum, _max_summand_count) {
	var summands;
	for (var i=0; i<_max_summand_count-1; i++) {
		var current_summand = irandom_range(1, _sum);
		_sum -= current_summand;
		summands[i] = current_summand;
		if _sum == 0 {
			return summands;
		}
	}
	// Set last summand to remaining sum, if any remains.
	summands[_max_summand_count-1] = _sum;
	return summands;
}

function get_enemy_from_difficulty(_difficulty) {
	// The highest case should also have the default case so that higher difficulties spawn that enemy.
	switch _difficulty {
		case 1:
			return obj_enemy_zombie;
		case 2:
			return obj_spider;
		case 3:
			return obj_enemy_wimp;
		case 4:
			return obj_evil_golf_kart;
		case 5:
		default:
			return obj_enemy_charger;
	}
}