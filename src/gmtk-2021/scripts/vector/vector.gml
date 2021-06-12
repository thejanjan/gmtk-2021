// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function vector_equal(_vec1, _vec2) {
	// We won't need this length test since all vectors are length 2.
	/*
	if _vec1.length != _vec2.length {
		return false;
	}
	*/
	for (var i=0; i<2; i++) {
		if _vec1[i] != _vec2[i] {
			return false;
		}
	}
	return true;
}

function vector_distance(_vec1, _vec2) {
	return vector_magnitude(vector_subtract(_vec1, _vec2));
}

function vector_add(_vec1, _vec2) {
	return [_vec1[0] + _vec2[0], _vec1[1] + _vec2[1]];
}

function vector_subtract(_vec1, _vec2) {
	return [_vec1[0] - _vec2[0], _vec1[1] - _vec2[1]];
}

function vector_magnitude_squared(_vec) {
	return _vec[0] * _vec[0] + _vec[1] * _vec[1];
}

function vector_magnitude(_vec) {
	return sqrt(vector_magnitude_squared(_vec));
}

function vector_normalize(_vec) {
	var magnitude = vector_magnitude(_vec);
	if magnitude == 0 {
		return _vec;
	} else {
		var divisor = 1 / vector_magnitude(_vec);
		return [_vec[0] * divisor, _vec[1] * divisor];
	}
}

function vector_dot(_vec1, _vec2) {
	return _vec1[0] * _vec2[0] + _vec1[1] * _vec2[1];
}

function vector_scale(_vec, _scale_factor) {
	return [_vec[0] * _scale_factor, _vec[1] * _scale_factor];	
}

function vector_delta_to(_start, _end) {
	return vector_subtract(_end, _start);
}

function vector_heading_to(_start, _end) {
	return vector_normalize(vector_delta_to(_start, _end));
}

function vector_make_from_direction(_dir) {
	return [cos(degtorad(_dir)), -sin(degtorad(_dir))];
}

function vector_midpoint(_vec1, _vec2) {
	return [0.5 * (_vec1[0] + _vec2[0]), 0.5 * (_vec1[1] + _vec2[1])]
}

function vector_random_between(_vec1, _vec2, min_dist, max_dist) {
	var vector_dist = vector_subtract(_vec2, _vec1);
	return [_vec1[0] + (vector_dist[0] * random_range(min_dist, max_dist)), _vec1[1] + (vector_dist[1] * random_range(min_dist, max_dist)),]
}