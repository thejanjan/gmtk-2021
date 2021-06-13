/// @description Insert description here
// You can write your code in this editor
game_end();
var dir = vector_heading_to([x, y], [other.x, other.y]);
dir = vector_scale(dir, impulse_force);
physics_apply_impulse(x, y, dir[0], dir[1]);