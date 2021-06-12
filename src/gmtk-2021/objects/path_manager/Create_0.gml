/// @description Build the path array

// adjustment variables
BORDER = 200;
CURRENT_HOLE = 1;
MINIMUM_LENGTH = 800;
LENGTH_PER_HOLE = 100;

// make start and end point
MAXIMUM_LENGTH = min(room_width, room_height) - (2 * BORDER);
CURRENT_HOLE_LENGTH = min(MINIMUM_LENGTH + (CURRENT_HOLE * LENGTH_PER_HOLE), MAXIMUM_LENGTH);

TRUE_WIDTH = room_width - (2 * BORDER);
TRUE_HEIGHT = room_height - (2 * BORDER);
ROOM_CENTER = [room_width / 2, room_height / 2];
AXIS_CHOOSE = choose(0, 1);
FLIP_SIDE = choose(0, 1);
if AXIS_CHOOSE { // top or bottom side
	var offset = BORDER;
	if FLIP_SIDE offset = room_height - BORDER;
	
	MAXIMUM_LENGTH = TRUE_WIDTH;
	START_POINT = [BORDER + irandom(TRUE_WIDTH), offset];
	var direction_vector = vector_heading_to(START_POINT, ROOM_CENTER);
	END_POINT = vector_add(START_POINT, vector_scale(direction_vector, CURRENT_HOLE_LENGTH));
} else { // left or right side
	var offset = BORDER;
	if FLIP_SIDE offset = room_width - BORDER;
	
	MAXIMUM_LENGTH = TRUE_WIDTH;
	START_POINT = [offset, BORDER + irandom(TRUE_HEIGHT)];
	var direction_vector = vector_heading_to(START_POINT, ROOM_CENTER);
	END_POINT = vector_add(START_POINT, vector_scale(direction_vector, CURRENT_HOLE_LENGTH));
}

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
// path_add_vector([400, 2000], 1);