/// @description Insert description here
// You can write your code in this editor
// event_inherited();
repeat(4) {
	instance_create_layer(x + irandom_range(-10, 10), y + + irandom_range(-10, 10), instance_layer, obj_spider);
}