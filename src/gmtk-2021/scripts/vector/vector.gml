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
	divisor = 1 / vector_magnitude(_vec);
	return [_vec[0] * divisor, _vec[1] * divisor];
}

function vector_dot(_vec1, _vec2) {
	return _vec1[0] * _vec2[0] + _vec1[1] * _vec2[1];
}

function vector_make_from_direction(_dir) {
	
}
