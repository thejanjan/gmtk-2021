/// @description physics controls

update_current_velocity();

var hole = nearest_active_hole();

if hit_by_club() {
	var dir = vector_heading_to([obj_golfer.x, obj_golfer.y], [x, y]);
	if hole {
		var nearest_hole = instance_nearest(x, y, obj_hole);
		dir = vector_heading_to([x, y], [nearest_hole.x, nearest_hole.y]);
	}
	club_apply_impulse(dir, 1.0);
	if hit_timer == 0 {
		audio_play_sound(choose(snd_golf1, snd_golf2, snd_golf3), 0, false);
		hit_timer = 5;
		var earth_damage = get_golf_the_earth_damage();
		if earth_damage > 0 {
			global.camera_shake = 10;
			create_aoe_damage([x, y], 1000, earth_damage);
		}
	}
}

if not hole exit;

var distohole = point_distance(x, y, hole.x, hole.y);
if distohole < 7
{
    instance_destroy();
    hole.flamming = true;
	audio_play_sound(choose(snd_flame1, snd_flame2, snd_flame3), 0, false);
	var hole_damage = get_explosive_hole_damage();
	if hole_damage > 0 {
		create_aoe_damage([x, y], 256, hole_damage);
	}
}
else if distohole < 15
{
	var dir = vector_heading_to([x, y], [hole.x, hole.y]);
	dir = vector_scale(dir, 2);
	physics_apply_impulse(x, y, dir[0], dir[1]);
	phy_speed_y /= 1+0.5*(1-(distohole/15));
	phy_speed_y /= 1+0.5*(1-(distohole/15));
};

if hit_timer > 0 {
	hit_timer--;
}