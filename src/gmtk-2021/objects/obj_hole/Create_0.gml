/// @description Insert description here
// You can write your code in this editor
flamming = false;
flip = false;

frame_time = 6;
timer = irandom(100);
image_index = 0;

/*emitter = part_emitter_create(global.particle_sys);
part_emitter_region(global.particle_sys, emitter, x - 8, x + 8, y - 8, y + 8, ps_shape_ellipse, ps_distr_gaussian)
stream_timer = -1;*/

var a = instance_create_layer(x, y, layer, obj_depth_hole);
a.image_index = 10;
a.image_speed = 0;