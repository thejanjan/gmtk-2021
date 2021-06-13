/// @description Insert description here
// You can write your code in this editor
if current_state = charger_state.charging
{
	draw_sprite(sprite_index, 8+(charge_frame mod 5), x, y);
	charge_frame ++;
}
else
{
	if instance_number(obj_golfer) >= 1
	{
		current_direction = point_direction(x, y, obj_golfer.x, obj_golfer.y);
		var slice = 360 / 8;
		var direction_val = round((current_direction mod 360) / slice) mod 8;
		draw_sprite(sprite_index, direction_val, x, y);
		charge_frame = 0;
	}
}
event_inherited();