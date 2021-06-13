/// @description Put me in first room
randomize();
globalvar CURRENT_HOLE; CURRENT_HOLE = 0;
globalvar CURRENT_FLAGS; CURRENT_FLAGS = 0;

global.l_particle = layer_create(-10);

// particles
global.particle_sys = part_system_create_layer(global.l_particle, false);

global.p_fire = part_type_create();
// fire
part_type_shape(global.p_fire, pt_shape_disk);
part_type_size(global.p_fire, 1, 1.5, -0.01, 0.10);
part_type_speed(global.p_fire, 0, 3, 0, 1);
part_type_direction(global.p_fire, 0, 360, 0, 30);
part_type_gravity(global.p_fire, .25, 90);
part_type_life(global.p_fire, 20, 60);
part_type_color2(global.p_fire, $1C55FF, $122EFF);

global.p_fireburst = part_type_create();
// fire
part_type_shape(global.p_fireburst, pt_shape_disk);
part_type_size(global.p_fireburst, 1, 1.5, -0.01, 0.10);
part_type_speed(global.p_fireburst, 3, 5, 0, 1);
part_type_direction(global.p_fireburst, 0, 360, 0, 30);
part_type_gravity(global.p_fireburst, .25, 90);
part_type_life(global.p_fireburst, 20, 60);
part_type_color2(global.p_fireburst, $1C55FF, $122EFF);

reset_powerup_pool();