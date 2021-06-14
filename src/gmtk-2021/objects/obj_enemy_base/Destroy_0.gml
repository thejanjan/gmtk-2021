/// @description Insert description here
// You can write your code in this editor
// hello = object_get_name(object_index);
instance_create_layer(x, y, "Instances", obj_explosion);
var how_many_balls = irandom_range(1, min(round(hp_max/35), 4));
if (object_index != obj_spider_deluxe)
for (var i=0; i<how_many_balls; i++)
{
	o = instance_create_depth(x, y, -y, obj_ball);
	with (o) {
		var dir = vector_make_from_direction(irandom(360));
		var acceleration_vector = vector_scale(dir, random_range(10, 25));
		real_y = 20;
		real_yspeed = -random(2);
		physics_apply_impulse(x, y, acceleration_vector[0], acceleration_vector[1]);
	}
}

if object_index = obj_enemy_zombie {
	if current_state = state.eating {
		var ball = instance_create_layer(x, y + 2, instance_layer, obj_ball);
		ball.real_y = 50;	
	}
}