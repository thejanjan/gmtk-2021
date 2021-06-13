// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function hp_deal_damage(_hp){
	if !hp_bar_exists() return;
	if obj_golfer.image_alpha < 1 return;
	if hp_bar.invulnerable > 0 return;
	hp_bar.hp -= _hp;
	hp_bar.invulnerable = hp_bar.invulnerable_length;
	audio_play_sound(snd_player_hurt, 0, false);
	if hp_bar.hp <= 0 hp_dead();
}

function hp_bar_exists() {
	return instance_exists(hp_bar);	
}

function hp_increase_maxhp(_amount) {
	if !hp_bar_exists() return;
	hp_bar.invulnerable = 0;
	hp_bar.maxhp += _amount;
	hp_bar.hp = hp_bar.maxhp;
}

function hp_reset() {
	hp_bar.maxhp = 3;
	hp_bar.hp = hp_bar.maxhp;
}

function hp_dead() {
	if instance_exists(obj_golfer) {
		audio_stop_sound(mus_early_holes);
		audio_stop_sound(mus_game_over);
		audio_stop_sound(mus_late_holes_1);
		audio_stop_sound(mus_late_holes_2);
		audio_stop_sound(mus_title_screen);
		audio_play_sound(snd_player_death, 0, false);
		if instance_exists(obj_golf_kart) {
			obj_golf_kart.controllable = 0;
			obj_golf_kart.alarm[2] = 100;
		}
		with (obj_golfer) {
			instance_destroy();
			instance_create_depth(x, y, -y, obj_explosion);
			var how_many_balls = 20;
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
		}
	}
}

function enemy_take_damage(_amount) {
	hp -= _amount;
	if hp <= 0 {
		event_perform(ev_other, ev_user10);  // Execute before death, if we need
		audio_play_sound(snd_enemy_die, 0, false);
		instance_destroy();
	}
	// instance_exists(obj_golf_kart) && point_distance(x, y, obj_golf_kart.x, obj_golf_kart.y) < 1000
	var in_x = x > camera_get_view_x(view_camera[0]) && x < camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
	var in_y = y > camera_get_view_y(view_camera[0]) && y < camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
	if _amount > 0 && in_x && in_y {
		var text = instance_create_layer(x, y, instance_layer, obj_rising_text);
		text.str = "-" + string(ceil(_amount));
		text.col = c_red;
		text.scale = 0.7;
	}
}

function enemy_set_starting_hp(_amount) {
	var true_amount = _amount;
	if instance_exists(path_manager) {
		true_amount *= path_manager.HP_SCALE;	
	}
	hp = true_amount;
	hp_max = true_amount;
}