/// @description Insert description here
// You can write your code in this editor
flamming = false;
flip = false;

emitter = part_emitter_create(global.particle_sys);
part_emitter_region(global.particle_sys, emitter, x - 8, x + 8, y - 8, y + 8, ps_shape_ellipse, ps_distr_gaussian)
stream_timer = -1;