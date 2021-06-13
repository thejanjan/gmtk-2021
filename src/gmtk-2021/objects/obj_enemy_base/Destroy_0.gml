/// @description Insert description here
// You can write your code in this editor
// hello = object_get_name(object_index);
instance_create_layer(x, y, "Instances", obj_explosion);
var how_many_balls = irandom_range(0, min(round(hp_max/50), 2));
for (var i=0; i<how_many_balls; i++)
{
	o = instance_create_depth(x, y, -y, obj_ball);
	with(o)
	{
		var dir = vector_heading_to([0, 0], [random_range(-10, 10), random_range(-10, 10)]);
		var acceleration_vector = vector_scale(dir, random_range(10, 25));
		physics_apply_impulse(x, y, acceleration_vector[0], acceleration_vector[1]);
	}
}