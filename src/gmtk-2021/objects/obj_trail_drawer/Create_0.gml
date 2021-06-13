/// @description Insert description here
// You can write your code in this editor
depth = 100;

tread_surface = -1;
hole_surface = -1;
deep_hole_surface = -1;

if !variable_global_exists("trails_activated")
{
	global.trails_activated = true;	
}