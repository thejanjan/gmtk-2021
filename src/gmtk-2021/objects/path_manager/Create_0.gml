/// @description Build the path array

CURRENT_HOLE++;

if !instance_exists(obj_phys_control)
	instance_create_layer(0, 0, layer, obj_phys_control);

audio_stop_sound(snd_engine);

// adjustment variables
HOLE_MULTIPLY = 2; // Overall per hole multiplier
BORDER = 700;
MINIMUM_LENGTH = 1500;
LENGTH_PER_HOLE = 500 * HOLE_MULTIPLY;
TWISTS = 1;
TWISTS_PER_HOLE = 0.2 * HOLE_MULTIPLY;
MAX_TWISTS = 7;
TWIST_DISTANCE = 0.6;
TWIST_DISTANCE_PER_HOLE = 0.2 * HOLE_MULTIPLY;
MINIMUM_TWIST_DISTANCE = -4;
CURVES_COUNT = 3;
CURVES_PER_HOLE = 0.4 * HOLE_MULTIPLY;
MAX_CURVES = 10;
CURVES_OFFSET = 2;
CURVES_OFFSET_PER_HOLE = 0.2 * HOLE_MULTIPLY;
MAX_CURVES_OFFSET = 8;
NODE_DISTANCE = 100;
NODE_DISTANCE_PER_HOLE = 0 * HOLE_MULTIPLY;
NODE_MINIMUM = 100;
NODE_OFFSET = 5;
NODE_OFFSET_PER_HOLE = 0.25 * HOLE_MULTIPLY;
MAX_NODE_OFFSET = 16;
FURTHEST_VECTOR_MAXIMUM = 1500;
FURTHEST_VECTOR_PER_HOLE = 75 * HOLE_MULTIPLY;
OPENING_HOLES_WITH_ITEMS = 2;

DARK_REMOVE_RADIUS = 400;
LIGHT_REMOVE_RADIUS = 250;
DISTANCE_BETWEEN_TILE_REMOVAL = 130;

GOLFBALLS_PER_LENGTH = 1;
GOLFBALLS_PER_LENGTH_PER_HOLE = 0.3 * HOLE_MULTIPLY;
MAX_GOLFBALLS_PER_LENGTH = 3;
GOLFBALL_OFFSET = 220;
MIN_GOLFBALL_DISTANCE = 24;

HOLE_FLAGS = 2;
HOLE_FLAGS_PER_HOLE = 0.5 * HOLE_MULTIPLY;
MAX_FLAGS = 18;
FLAG_OFFSET = 230;

ENEMY_PER_LENGTH = 2;
ENEMY_PER_LENGTH_PER_HOLE = 0.6 * HOLE_MULTIPLY;
MAX_ENEMY_PER_LENGTH = 12;
ENEMY_OFFSET = 120;
GRACE_RADIUS = 750;
ENEMY_VISION = 650;

DIFFICULTY_PER_LENGTH = 1;
DIFFICULTY_PER_LENGTH_PER_HOLE = 0.45 * HOLE_MULTIPLY;
HORDE_CHANCE = 0;
HORDE_CHANCE_PER_HOLE = 0.015 * HOLE_MULTIPLY;
MAX_HORDE_CHANCE = 0.3;
HP_SCALE = 2 + (CURRENT_HOLE / 3);

if random(1) < min(HORDE_CHANCE + (CURRENT_HOLE * HORDE_CHANCE_PER_HOLE), MAX_HORDE_CHANCE) {
	ENEMY_PER_LENGTH_PER_HOLE *= 3;
	DIFFICULTY_PER_LENGTH_PER_HOLE /= 2;
}

/*
ENEMY_PER_LENGTH = 1;
ENEMY_PER_LENGTH_PER_HOLE = 0.2 * HOLE_MULTIPLY;
MAX_ENEMY_PER_LENGTH = 4;
ENEMY_OFFSET = 200;

enemy_difficulties = split_into_random_summands(current_difficulty, max_enemies_spawned_per_wave);
var enemies_to_spawn = array_length_1d(enemy_difficulties);
for (var i=0; i<enemies_to_spawn; i++)
{
	var enemy_type = get_enemy_from_difficulty(enemy_difficulties[i]);
	instance_create_layer(64 + 64*i, 64, instance_layer_id, enemy_type);
}
current_difficulty += difficulty_increase_per_wave;
*/

ENABLE_TWISTS = true;
ENABLE_CURVES = false;
ENABLE_NODES = false;

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
MAX_PATH_LENGTH = 1000
TOTAL_PATH = array_create(MAX_PATH_LENGTH + 1, -1);
TOTAL_PATH = [START_POINT, END_POINT];
TOTAL_PATH_LENGTH = 2;

// add point
function path_add_vector(_vector, _index) {
	// Places a vector at a given index
	// (if you place it at index 1, it'll move index 1 and everything past it forward one)
	if TOTAL_PATH_LENGTH >= MAX_PATH_LENGTH return;
	var len = array_length(TOTAL_PATH);
	// array_resize(TOTAL_PATH, len + 1);
	var copy_length = len - _index;
	array_copy(TOTAL_PATH, _index + 1, TOTAL_PATH, _index, copy_length);
	array_set(TOTAL_PATH, _index, _vector);
	TOTAL_PATH_LENGTH++;
}

function condense_vector(_vector) {
	// Keeps the vector in the level range
	return [median(BORDER, _vector[0], room_width - BORDER), median(BORDER, _vector[1], room_height - BORDER)]
}

// add twists
if ENABLE_TWISTS
repeat (min( floor( TWISTS + (CURRENT_HOLE * TWISTS_PER_HOLE)), MAX_TWISTS )) {
	var total_path_index = TOTAL_PATH_LENGTH - 1;
	var left = TOTAL_PATH[total_path_index - 1];
	var right = TOTAL_PATH[total_path_index];
	
	// var middle = vector_midpoint(left, right);
	var dist = max(TWIST_DISTANCE - (CURRENT_HOLE * TWIST_DISTANCE_PER_HOLE), MINIMUM_TWIST_DISTANCE);
	var corners = [[left[0], right[1]], [right[0], left[1]]];
	var new_twist = vector_random_between(corners[0], corners[1], dist, 1 - dist);
	path_add_vector(condense_vector(new_twist), total_path_index);
}


// curve generation (deprecated)
var true_curve_count = min(floor(CURVES_COUNT + (CURRENT_HOLE * CURVES_PER_HOLE)), MAX_CURVES);
var true_curve_offset = min(floor(CURVES_OFFSET + (CURRENT_HOLE * CURVES_OFFSET_PER_HOLE)), MAX_CURVES_OFFSET);
var curve_climb_dist = 1 / true_curve_count;
if ENABLE_CURVES
for (var i = TOTAL_PATH_LENGTH - 1; i > 0; i--) {
	for (var o = 1; o < true_curve_count; o++) {
		var path_vector = vector_between(TOTAL_PATH[i + (o - 1)], TOTAL_PATH[i - 1], o * curve_climb_dist);
		path_vector = vector_add(path_vector, [choose(-1, 1) * irandom(true_curve_offset), choose(-1, 1) * irandom(true_curve_offset)]);
		path_add_vector(condense_vector(path_vector), i);
	}
}

// node generation
var true_node_offset = min(NODE_OFFSET + (CURRENT_HOLE * NODE_OFFSET_PER_HOLE), MAX_NODE_OFFSET);
if ENABLE_NODES
for (var i = TOTAL_PATH_LENGTH - 1; i > 0; i--) {
	var dist_between_path_points = vector_distance(TOTAL_PATH[i - 1], TOTAL_PATH[i]);
	var node_distance = max(NODE_DISTANCE + (CURRENT_HOLE * NODE_DISTANCE_PER_HOLE), NODE_MINIMUM);
	var nodes_to_build = floor(dist_between_path_points / node_distance);
	var compare_these = [TOTAL_PATH[i], TOTAL_PATH[i - 1]];
	for (var o = 0; o < nodes_to_build; o++) {
		var path_vector = vector_between(compare_these[0], compare_these[1], (o + 1) * (1 / (nodes_to_build + 1)));
		path_vector = vector_add(path_vector, [choose(-1, 1) * irandom(true_node_offset), choose(-1, 1) * irandom(true_node_offset)]);
		path_add_vector(condense_vector(path_vector), i);
	}
}

/*
NODE_DISTANCE = 300;
NODE_DISTANCE_PER_HOLE = -20;
NODE_MINIMUM = 80;
NODE_OFFSET = 5;
NODE_OFFSET_PER_HOLE = 0.25;
MAX_NODE_OFFSET = 10;
*/

// find furthest point
START_VECTOR = TOTAL_PATH[0];
CURRENT_DIST = 0;
BEST_INDEX = 0;
for (var i = 1; i < TOTAL_PATH_LENGTH; i++) {
	var dist = vector_distance(START_VECTOR, TOTAL_PATH[i])
	if dist > CURRENT_DIST {
		CURRENT_DIST = dist;
		BEST_INDEX = i;
	}
}
FURTHEST_VECTOR = TOTAL_PATH[BEST_INDEX];
GOAL_VECTOR = TOTAL_PATH[TOTAL_PATH_LENGTH - 1];

// define if furthest exists, place a passive nearby if so
FURTHEST_VECTOR_MINIMUM = -FURTHEST_VECTOR_PER_HOLE;
FURTHEST_EXISTS = 0;
// show_message(string(vector_distance(FURTHEST_VECTOR, GOAL_VECTOR)) + " >= " + string(min(FURTHEST_VECTOR_MINIMUM + (CURRENT_HOLE * FURTHEST_VECTOR_PER_HOLE), FURTHEST_VECTOR_MAXIMUM)));
if	vector_distance(FURTHEST_VECTOR, GOAL_VECTOR) >= min(FURTHEST_VECTOR_MINIMUM + (CURRENT_HOLE * FURTHEST_VECTOR_PER_HOLE), FURTHEST_VECTOR_MAXIMUM)
	or CURRENT_HOLE <= OPENING_HOLES_WITH_ITEMS
	FURTHEST_EXISTS = 1;

var path_string = "";

for (var i = 0; i < TOTAL_PATH_LENGTH; i++) {
	path_string = path_string + vector_repr(TOTAL_PATH[i]) + ", ";
}

// show_message("Current hole: "+string(CURRENT_HOLE)+"\n Path length: "+string(array_length(TOTAL_PATH))+"\n Path repr: "+path_string);

// Generate aesthetic tiles and trees.
regen_grass();

for (var i = 0; i < TOTAL_PATH_LENGTH - 1; i++) {
	var dist_between_points = vector_magnitude(vector_subtract(TOTAL_PATH[i + 1], TOTAL_PATH[i]));
	var points_to_check = ceil(dist_between_points / DISTANCE_BETWEEN_TILE_REMOVAL);
	var percentage_to_check = 1 / points_to_check;
	for (var o = 0; o < points_to_check; o++) {
		var remove_vec = vector_between(TOTAL_PATH[i], TOTAL_PATH[i + 1], o * percentage_to_check)
		remove_grass_tile_radius(remove_vec[0], remove_vec[1], DARK_REMOVE_RADIUS, "layer_dark");
		remove_grass_tile_radius(remove_vec[0], remove_vec[1], LIGHT_REMOVE_RADIUS, "layer_light");
	}
}

// Spawn golfballs
//GOLFBALLS_PER_LENGTH = 2;
//GOLFBALLS_PER_LENGTH_PER_HOLE = 0.5 * HOLE_MULTIPLY;
CURRENT_BALL_COUNT = min(GOLFBALLS_PER_LENGTH + (CURRENT_HOLE * GOLFBALLS_PER_LENGTH_PER_HOLE), MAX_GOLFBALLS_PER_LENGTH);
for (var i = 0; i < TOTAL_PATH_LENGTH - 1; i++) {
	var dist_between_points = vector_magnitude(vector_subtract(TOTAL_PATH[i + 1], TOTAL_PATH[i]));
	var balls_to_add = CURRENT_BALL_COUNT;
	var percentage_to_check = 1 / (balls_to_add + 1);
	for (var o = 1; o <= balls_to_add; o++) {
		var spawn_vec = vector_between(TOTAL_PATH[i], TOTAL_PATH[i + 1], o * percentage_to_check)
		var _x = spawn_vec[0] + (choose(-1, 1) * irandom(GOLFBALL_OFFSET));
		var _y = spawn_vec[1] + (choose(-1, 1) * irandom(GOLFBALL_OFFSET));
		if instance_exists(obj_ball) {
			repeat 5 {// Attempts to move
				var n = instance_nearest(_x, _y, obj_ball);
				if vector_magnitude(vector_subtract([n.x, n.y], [_x, _y])) < MIN_GOLFBALL_DISTANCE {
					_x += choose(MIN_GOLFBALL_DISTANCE, -MIN_GOLFBALL_DISTANCE);
					_y += choose(MIN_GOLFBALL_DISTANCE, -MIN_GOLFBALL_DISTANCE);
				} else break;
			}
		}
		instance_create_layer(_x, _y, layer, obj_ball);							
	}
}

// Spawn flags
CURRENT_HOLE_COUNT = floor(min(HOLE_FLAGS + (CURRENT_HOLE * HOLE_FLAGS_PER_HOLE), MAX_FLAGS));
for (var i = 0; i < TOTAL_PATH_LENGTH - 1; i++) {
	if instance_number(obj_hole) >= CURRENT_HOLE_COUNT or instance_number(obj_hole) >= instance_number(obj_ball) break;
	var dist_between_points = vector_magnitude(vector_subtract(TOTAL_PATH[i + 1], TOTAL_PATH[i]));
	var flags_to_add = ceil(CURRENT_HOLE_COUNT / (TOTAL_PATH_LENGTH - 1))// min(GOLFBALLS_PER_LENGTH + (CURRENT_HOLE * GOLFBALLS_PER_LENGTH_PER_HOLE), MAX_GOLFBALLS_PER_LENGTH);
	var percentage_to_check = 1 / (flags_to_add + 1);
	for (var o = 1; o <= flags_to_add; o++) {
		if instance_number(obj_hole) >= CURRENT_HOLE_COUNT or instance_number(obj_hole) >= instance_number(obj_ball) break;
		var spawn_vec = vector_between(TOTAL_PATH[i], TOTAL_PATH[i + 1], o * percentage_to_check)
		var _x = spawn_vec[0] + (choose(-1, 1) * irandom(FLAG_OFFSET));
		var _y = spawn_vec[1] + (choose(-1, 1) * irandom(FLAG_OFFSET));
		if instance_exists(obj_hole) {
			repeat 8 {// Attempts to move
				var n = instance_nearest(_x, _y, obj_hole);
				if vector_magnitude(vector_subtract([n.x, n.y], [_x, _y])) < MIN_GOLFBALL_DISTANCE {
					_x += choose(MIN_GOLFBALL_DISTANCE, -MIN_GOLFBALL_DISTANCE);
					_y += choose(MIN_GOLFBALL_DISTANCE, -MIN_GOLFBALL_DISTANCE);
				} else {
					var n = instance_nearest(_x, _y, obj_ball);
					if vector_magnitude(vector_subtract([n.x, n.y], [_x, _y])) < MIN_GOLFBALL_DISTANCE {
						_x += choose(MIN_GOLFBALL_DISTANCE, -MIN_GOLFBALL_DISTANCE);
						_y += choose(MIN_GOLFBALL_DISTANCE, -MIN_GOLFBALL_DISTANCE);
					} else break;
				}
			}
		}
		instance_create_layer(_x, _y, layer, obj_hole);							
	}
}
CURRENT_HOLE_COUNT = instance_number(obj_hole);

// I hate these
spawn_trees();

// Spawn end flag
instance_create_layer(GOAL_VECTOR[0], GOAL_VECTOR[1], layer, obj_end_hole);

// Spawn powerup
var from_end_radius = 80;
if FURTHEST_EXISTS {
	var _x = FURTHEST_VECTOR[0];
	var _y = FURTHEST_VECTOR[1];
	if vector_equal(FURTHEST_VECTOR, GOAL_VECTOR) {
		_x += choose(-from_end_radius, from_end_radius);
		_y += choose(-from_end_radius, 0, from_end_radius);
	}
	instance_create_layer(_x, _y, layer, obj_powerup_spawn_point);
}

// spawn the player
SPAWN_OFFSET = 30;
var spawn_x = START_VECTOR[0] + (choose(1, -1) * irandom(SPAWN_OFFSET));
var spawn_y = START_VECTOR[1] + (choose(1, -1) * irandom(SPAWN_OFFSET));
instance_create_layer(spawn_x, spawn_y, layer, obj_golf_kart)

// Spawn enemy
CURRENT_ENEMY_COUNT			= min(floor(ENEMY_PER_LENGTH + (CURRENT_HOLE * ENEMY_PER_LENGTH_PER_HOLE)), MAX_ENEMY_PER_LENGTH);
CURRENT_DIFFICULTY_COUNT	= floor(DIFFICULTY_PER_LENGTH + (CURRENT_HOLE * DIFFICULTY_PER_LENGTH_PER_HOLE))
//DIFFICULTY_PER_LENGTH = 1;
//DIFFICULTY_PER_LENGTH_PER_HOLE = 0.35 * HOLE_MULTIPLY;
for (var i = 0; i < TOTAL_PATH_LENGTH - 1; i++) {
	var enemy_difficulties = split_into_random_summands(CURRENT_DIFFICULTY_COUNT, CURRENT_ENEMY_COUNT);
	var enemies_to_spawn = array_length(enemy_difficulties);
	for (var o = 0; o < enemies_to_spawn; o++) {
		var spawn_vec = vector_random_between(TOTAL_PATH[i], TOTAL_PATH[i + 1], 0, 1)
		var _x = spawn_vec[0] + (choose(-1, 1) * irandom(ENEMY_OFFSET));
		var _y = spawn_vec[1] + (choose(-1, 1) * irandom(ENEMY_OFFSET));
		if vector_distance([_x, _y], [spawn_x, spawn_y]) < GRACE_RADIUS continue;
		
		var enemy_type = get_enemy_from_difficulty(enemy_difficulties[o]);
		var enemy = instance_create_layer(_x, _y, layer, enemy_type);					
		with (enemy) {
			if distance_to_object_new(obj_golf_kart) < path_manager.GRACE_RADIUS
				instance_destroy();
		}
	}
}


/*ENEMY_PER_LENGTH = 1;
ENEMY_PER_LENGTH_PER_HOLE = 0.2 * HOLE_MULTIPLY;
MAX_ENEMY_PER_LENGTH = 4;
ENEMY_OFFSET = 200;


enemy_difficulties = split_into_random_summands(current_difficulty, max_enemies_spawned_per_wave);
var enemies_to_spawn = array_length_1d(enemy_difficulties);
for (var i=0; i<enemies_to_spawn; i++)
{
	var enemy_type = get_enemy_from_difficulty(enemy_difficulties[i]);
	instance_create_layer(64 + 64*i, 64, instance_layer_id, enemy_type);
}
current_difficulty += difficulty_increase_per_wave;


// FURTHEST_VECTOR = TOTAL_PATH[BEST_INDEX];
// GOAL_VECTOR = TOTAL_PATH[TOTAL_PATH_LENGTH - 1];

/*
HOLE_FLAGS = 2;
HOLE_FLAGS_PER_HOLE = 0.25 * HOLE_MULTIPLY;
MAX_FLAGS = 18;
FLAG_OFFSET = 270;
*/


// music handler
if CURRENT_HOLE = 1 {
	if !audio_is_playing(mus_early_holes)
	audio_play_sound(mus_early_holes, 1, true);
} else if CURRENT_HOLE = 4 {
	audio_stop_sound(mus_early_holes);
	if !audio_is_playing(mus_late_holes_1)
	audio_play_sound(mus_late_holes_1, 1, true);
} else if CURRENT_HOLE = 7 {
	audio_stop_sound(mus_late_holes_1);
	if !audio_is_playing(mus_late_holes_2)
	audio_play_sound(mus_late_holes_2, 1, true);
}

// update tilesets to match zone
var zone = 1;
if CURRENT_HOLE >= 4 zone = 2;
if CURRENT_HOLE >= 7 zone = 3;

var dark_map_id = layer_tilemap_get_id(layer_get_id("layer_dark"));
var light_map_id = layer_tilemap_get_id(layer_get_id("layer_light"));
var background_id = layer_background_get_id(layer_get_id("Background"));
switch (zone) {
	case 2:
		tilemap_tileset(dark_map_id, tileset_dark2);
		tilemap_tileset(light_map_id, tileset_light2);
		with (obj_tree) image_index = 1;
		layer_background_change(background_id, spr_bggreen2);
		fuck;
	case 3:
		tilemap_tileset(dark_map_id, tileset_dark3);
		tilemap_tileset(light_map_id, tileset_light3);
		with (obj_tree) image_index = 2;
		layer_background_change(background_id, spr_bggreen3);
		fuck;
}


alarm[0] = 60 * 30;

/* FURTHEST_VECTOR_MINIMUM = 20;
FURTHEST_VECTOR_PER_HOLE = 20;
/*
CURVES_COUNT = 3;
CURVES_PER_HOLE = 0.4;
MAX_CURVES = 10;
CURVES_OFFSET = 20;
CURVES_OFFSET_PER_HOLE = 2;
MAX_CURVES_OFFSET = 50;
// test point
// path_add_vector([400, 2000], 1);
/*
TWIST_DISTANCE = 0.25;
TWIST_DISTANCE_PER_HOLE = 0.025;
MINIMUM_TWIST_DISTANCE = -0.3;