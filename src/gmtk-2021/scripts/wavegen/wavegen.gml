// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function split_into_summands(_sum, _max_summand_count) {
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