/// @description Insert description here
// You can write your code in this editor

alarm[0] = 60 * 30;
if !instance_exists(obj_golf_kart) exit;
instance_create_layer(obj_golf_kart.xstart, obj_golf_kart.ystart, "Instances", obj_ball);