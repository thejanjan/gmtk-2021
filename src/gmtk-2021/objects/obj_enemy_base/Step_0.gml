/// @description Track speed and other states
// You can write your code in this editor
current_speed = vector_magnitude(vector_subtract(current_pos, previous_pos));
previous_pos = current_pos;
current_pos = [x, y];

if instance_exists(obj_golfer)
if hit_by_club() {
	//show_debug_message("Enemy hit by club at " + string(current_time));
	
	var dir = vector_heading_to([obj_golfer.x, obj_golfer.y], [x, y]);
	club_apply_impulse(dir, 70.0);
	
	var base_damage = obj_golfer.current_speed + obj_golfer.club_base_damage;
	enemy_take_damage(base_damage * get_player_damage_multiplier());
	
	audio_play_sound(snd_enemy_smacked, 0, false);
	
	if object_index = obj_enemy_charger {
		if current_state = charger_state.warning {
			alarm[2] = 1;
		}
	}
}

// Hit by ball
if hit_by_ball_cooldown <= 0 {
	if place_meeting(x, y, obj_ball) {
		var lets_go = 1;
		if (object_index = obj_enemy_zombie) {
			if current_state != state.eating
				lets_go = 0;
		}
		if lets_go {
			hit_by_ball_cooldown = 10;
			var that_ball = instance_nearest(x, y, obj_ball);
			var min_speed_for_damage = 1;
			if that_ball.current_speed > min_speed_for_damage {
				var damage_mult = that_ball.current_speed;
				if that_ball.weak damage_mult *= 0.5;
				enemy_take_damage(get_ball_base_damage() * damage_mult);
				audio_play_sound(snd_enemy_smacked, 0, false);
			}
		}
	} 
} else if (hit_by_ball_cooldown > 0) hit_by_ball_cooldown--;

// This would be in the fire but you can't freaking access the take damage script from there...
if instance_exists(obj_fire_trail)
{
	var near_fire = instance_nearest(x, y, obj_fire_trail);
	if distance_to_object_new(near_fire) <= 10 {
		with (near_fire)
		{
			instance_destroy();
		};
		enemy_take_damage(0.1);
	}
};