/// @description physics controls

update_current_velocity();
spd = vector_magnitude(current_velocity);
if weak and ((spd < 0.5 and spd != 0) or image_alpha != 1) {
	image_alpha -= 1 / vanish_duration;
	if image_alpha <= 0
		instance_destroy();
}


var hole = nearest_active_hole();
var enemy = nearest_alive_enemy();
instance_activate_all();

if hit_by_club() and not weak {
	var dir = vector_heading_to([obj_golfer.x, obj_golfer.y], [x, y]);
	var max_travel_distance = 1200;
	var hole_dist = max_travel_distance;
	var enemy_dist = max_travel_distance;
	var going_to = -1;
	try {
		if hole and instance_exists(hole) {
			instance_activate_object(hole);
			hole_dist = min(vector_magnitude(vector_subtract([x, y], [hole.x, hole.y])), hole_dist)
		} if enemy and instance_exists(enemy) {
			instance_activate_object(enemy);
			enemy_dist = min(vector_magnitude(vector_subtract([x, y], [enemy.x, enemy.y])), enemy_dist)
		}		
		if enemy_dist != max_travel_distance enemy_dist /= 0.01 + (global.magnet_power * 0.33);
		hole_dist = min(hole_dist, max_travel_distance);
		enemy_dist = min(enemy_dist, max_travel_distance);
		if hole_dist < enemy_dist {
			dir = vector_heading_to([x, y], [hole.x, hole.y]); 
			going_to = 1;
		}
		if enemy_dist < hole_dist {
			dir = vector_heading_to([x, y], [enemy.x, enemy.y]); 
			going_to = 2;
		}
	}
	var hitting = 1;
	if going_to = 1 {
		hitting = 1.1;
		phy_speed_x = 0;
		phy_speed_y = 0;
	}
	var powered = club_apply_impulse(dir, hitting);
	if hit_timer = 0 {
		var shots = global.additional_shots;
		real_yspeed = -powered / 2;
		if hole {
			var distohole = point_distance(x, y, hole.x, hole.y);
			if distohole < 140 {
				real_yspeed /= 5;	
			}
		}
		if not weak and shots {
			var shift = 0.35;
			repeat shots {
				var new_ball = instance_create_layer(x, y, "Instances", obj_weak_ball);
				var new_dir = vector_add(dir, [random(shift) * choose(-1, 1), random(shift) * choose(-1, 1)]);
				with (new_ball) club_apply_impulse(new_dir, 0.85);
			}
		}
		audio_play_sound(choose(snd_golf1, snd_golf2, snd_golf3), 0, false);
		hit_timer = 5;
		var earth_damage = get_golf_the_earth_damage();
		if earth_damage > 0 {
			global.camera_shake = 6;
			create_aoe_damage([x, y], 500, earth_damage);
		}
	}
}

var _sign = sign(phy_speed_x) != 0 ? sign(phy_speed_x) : choose(-1, 1);
_angle -= _sign * 2 * vector_magnitude([phy_speed_x, phy_speed_y]);

if hit_timer > 0
	hit_timer--;

real_y -= real_yspeed;
if real_y < 0 {
	real_yspeed = -abs(real_yspeed / 3);
	real_y = 0;
} if real_y != 0 or real_yspeed != 0 {
	real_yspeed += real_gravity;
	var cap = 8;
	real_yspeed = median(-cap, real_yspeed, cap);
}

if not hole or weak or image_alpha != 1 exit;

var distohole = point_distance(x, y, hole.x, hole.y);
var bring_distance = 70;

if distohole < 7 {
    // image_alpha = 0.3;
    hole.flamming = true;
	audio_play_sound(choose(snd_flame1, snd_flame2, snd_flame3), 0, false);
	var hole_damage = get_explosive_hole_damage();
	if hole_damage > 0 {
		create_aoe_damage([x, y], 256, hole_damage);
		instance_create_layer(x, y, instance_layer, obj_explosion);
	}
	CURRENT_FLAGS++;
	if CURRENT_FLAGS >= instance_number(obj_hole) {
		audio_play_sound(snd_got_last_flag, 0, false);
	}
	instance_destroy();
} else if distohole < bring_distance {
	if real_y != 0 or real_yspeed != 0 {
		real_yspeed += real_gravity * 0.25;
		real_y -= real_yspeed * 1.25;
		if real_y < 0 {
			real_yspeed = -abs(real_yspeed / 6);
			real_y = 0;
		} 
		var cap = 8;
		real_yspeed = median(-cap, real_yspeed, cap);
	}
}
	/*
	var dir = vector_heading_to([x, y], [hole.x, hole.y]);
	dir = vector_scale(dir, 2);
	physics_apply_impulse(x, y, dir[0], dir[1]);
	phy_speed_x /= 1+0.5*(1-(distohole/bring_distance));
	phy_speed_y /= 1+0.5*(1-(distohole/bring_distance));*/