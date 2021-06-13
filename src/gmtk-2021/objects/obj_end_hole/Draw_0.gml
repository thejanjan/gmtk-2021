/// @description Insert description here
// You can write your code in this editor

var bounce_size = 2;
var bounce_speed = 6000; // Less is faster
var bounce_offset = round(bounce_size * sin(degtorad( round(get_timer() / bounce_speed) )));

var flags = CURRENT_FLAGS;
var max_flags = floor(path_manager.CURRENT_HOLE_COUNT);
var complete = 0;
if flags >= max_flags complete = 1;

draw_sprite(sprite_index, 2 + complete, x, y + bounce_offset - 32);
var hole = instance_nearest(x, y, obj_depth_hole);
hole.image_index = complete;

//if stream_timer > 0 { stream_timer--; }