// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function hp_deal_damage(_hp){
	if !hp_bar_exists() return;
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

function hp_dead() {
	if instance_exists(obj_golfer) {
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

function reset_game() {
	// TODO: Make this not suck.
	hp_bar.hp = 3;
	hp_bar.maxhp = 3;
	room_restart();
}