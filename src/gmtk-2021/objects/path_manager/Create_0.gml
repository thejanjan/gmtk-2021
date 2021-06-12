/// @description Build the path array

// adjustment variables
BORDER = 200;

// make start and end point
START_POINT = [BORDER, BORDER];
END_POINT = [room_width - BORDER, room_height - BORDER];

// establish path
TOTAL_PATH = [START_POINT, END_POINT];

// add point
function path_add_vector(_vector, _index) {
	// Places a vector at a given index
	// (if you place it at index 1, it'll move index 1 and everything past it forward one)
	var len = array_length(TOTAL_PATH);
	array_resize(TOTAL_PATH, len + 1);
	var copy_length = len - _index;
	array_copy(TOTAL_PATH, _index + 1, TOTAL_PATH, _index, copy_length);
	array_set(TOTAL_PATH, _index, _vector);
}

// test point
path_add_vector([400, 2000], 1);