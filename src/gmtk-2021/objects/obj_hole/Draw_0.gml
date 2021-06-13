/// @description Insert description here
// You can write your code in this editor
timer++;
instance_activate_all();

var draw_frame = (floor(timer / frame_time) mod 5) + (flamming * 5)
if flamming
{
	
	/*
	draw_sprite_ext(sprite_index, 1, x, y, flip?-1:1, 1, 0, c_white, 1);
	if irandom_range(1,5) == 5
		flip = not flip;
	for (var i=1; i<10; i++)
	{
		draw_sprite_ext(sprite_index, 2, x, y-64*i, flip?-1:1, 1, 0, c_white, 1);
	}
	*/
	if stream_timer == -1 {
		stream_timer = 20;
		part_emitter_stream(global.particle_sys, emitter, global.p_fireburst, 1);
	}
	if stream_timer == 0 {
		part_emitter_stream(global.particle_sys, emitter, global.p_fire, -10);
	}
}

draw_sprite(sprite_index, draw_frame, x, y);	

if stream_timer > 0 { stream_timer--; }