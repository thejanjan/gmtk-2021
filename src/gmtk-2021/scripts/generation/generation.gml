// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function force_next_hole() {
	if instance_exists(path_manager) {
		if CURRENT_FLAGS < floor(path_manager.CURRENT_HOLE_COUNT)
			exit;
	}
	CURRENT_FLAGS = 0;
	with (all) {
		alive = 0;
		if persistent alive = 1;
		if object_index = path_manager alive = 0;
		if not alive instance_destroy();
	}
	with (hp_bar) {
		ball_letters = [];
	}
	instance_create_layer(0, 0, "Instances", path_manager);
}

function regenerate_holes() {
	CURRENT_FLAGS = 0;
	CURRENT_HOLE = 0;
	with (all) {
		alive = 0;
		if persistent alive = 1;
		if object_index = path_manager alive = 0;
		if not alive instance_destroy();
	}
	with (hp_bar) {
		ball_letters = [];
	}
	global.player_damage_multiplier = 1.0;
	global.player_acceleration = 150.0;
	global.golf_the_earth_damage = 0;
	global.growth_spurt = 0;
	global.explosive_hole_damage = 0;
	global.player_fire_trails = 0;
	global.magnet_power = 0;
	global.additional_shots = 0;
	var dark_map_id = layer_tilemap_get_id(layer_get_id("layer_dark"));
	var light_map_id = layer_tilemap_get_id(layer_get_id("layer_light"));
	var background_id = layer_background_get_id(layer_get_id("Background"));
	tilemap_tileset(dark_map_id, tileset_dark);
	tilemap_tileset(light_map_id, tileset_light);
	with (obj_tree) image_index = 0;
	layer_background_change(background_id, spr_bggreen);
	reset_powerup_pool();
	hp_reset();
	instance_create_layer(0, 0, "Instances", path_manager);
}