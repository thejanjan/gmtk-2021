/// @description Insert description here
// You can write your code in this editor

image_index = 2;

/*emitter = part_emitter_create(global.particle_sys);
part_emitter_region(global.particle_sys, emitter, x - 8, x + 8, y - 8, y + 8, ps_shape_ellipse, ps_distr_gaussian)
stream_timer = -1;*/

hole = instance_create_layer(x, y, layer, obj_depth_hole); 
hole.sprite_index = sprite_index;
hole.image_index = 0;
hole.image_speed = 0;
image_speed = 0;