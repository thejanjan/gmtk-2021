/// @description Build the path array

// adjustment variables
BORDER = 400;
CURRENT_HOLE++;
MINIMUM_LENGTH = 800;
LENGTH_PER_HOLE = 100;
TWISTS = 1;
TWISTS_PER_HOLE = 0.2;
MAX_TWISTS = 7;
TWIST_DISTANCE = 0.25;
TWIST_DISTANCE_PER_HOLE = 0.025;
MINIMUM_TWIST_DISTANCE = -0.7;

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
	var o_offset = room_height - BORDER;
	if FLIP_SIDE {offset = o_offset; o_offset = BORDER;}
	
	MAXIMUM_LENGTH = TRUE_WIDTH;
	START_POINT = [BORDER + irandom(TRUE_WIDTH), offset];
	var going_to = ROOM_CENTER; // [BORDER + irandom(TRUE_WIDTH), o_offset];
	var direction_vector = vector_heading_to(START_POINT, ROOM_CENTER);
	END_POINT = vector_add(START_POINT, vector_scale(direction_vector, CURRENT_HOLE_LENGTH));
} else { // left or right side
	var offset = BORDER;
	var o_offset = room_width - BORDER;
	if FLIP_SIDE {offset = o_offset; o_offset = BORDER;}
	
	MAXIMUM_LENGTH = TRUE_WIDTH;
	START_POINT = [offset, BORDER + irandom(TRUE_HEIGHT)];
	var going_to = ROOM_CENTER; // [o_offset, BORDER + irandom(TRUE_HEIGHT)];
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

function condense_vector(_vector) {
	// Keeps the vector in the level range
	return [median(BORDER, _vector[0], room_width - BORDER), median(BORDER, _vector[1], room_height - BORDER)]
}

// add twists
repeat (min( floor( TWISTS + (CURRENT_HOLE * TWISTS_PER_HOLE)), MAX_TWISTS )) {
	var total_path_index = array_length(TOTAL_PATH) - 1;
	var left = TOTAL_PATH[total_path_index - 1];
	var right = TOTAL_PATH[total_path_index];
	
	// var middle = vector_midpoint(left, right);
	var dist = max(TWIST_DISTANCE - (CURRENT_HOLE * TWIST_DISTANCE_PER_HOLE), MINIMUM_TWIST_DISTANCE);
	var corners = [[left[0], right[1]], [right[0], left[1]]];
	var new_twist = vector_random_between(corners[0], corners[1], dist, 1 - dist);
	path_add_vector(condense_vector(new_twist), total_path_index);
}

// test point
// path_add_vector([400, 2000], 1);
/*
TWIST_DISTANCE = 0.25;
TWIST_DISTANCE_PER_HOLE = 0.025;
MINIMUM_TWIST_DISTANCE = -0.3;