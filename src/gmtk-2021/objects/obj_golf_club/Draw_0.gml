/// @description Draw the club

var dad = obj_golfer;
x = dad.x;
y = dad.y;

if mouse_check_button_pressed(mb_left) and swing = 0 and timer = 0 {
	timer = swing_length;
	swing = 1;
}

var club_angle = dad.facing;
// todo: angle the club towards the nearest target, minus 45
// also figure out what those targets are lmao

// current debug: aim towards mouse
var club_angle = point_direction(dad.x, dad.y, mouse_x, mouse_y);


// make swing offset

if swing = 0 {
	draw_sprite_ext(sprite_index, mode * 2, x, y, image_xscale, image_yscale, club_angle, image_blend, image_alpha);
	if timer > 0 timer--;
} else {
	draw_sprite_ext(sprite_index, 1 + (mode * 2), x, y, image_xscale, image_yscale, club_angle, image_blend, image_alpha);	
	timer--;
	if timer = 0 {
		audio_play_sound(choose(snd_swing1, snd_swing2, snd_swing3), 0, false);
		if place_meeting(x, y, obj_ball) {
			audio_play_sound(choose(snd_golf1, snd_golf2, snd_golf3), 0, false);
		}
		mode = not mode;
		swing = 0;
		timer = cooldown;
	}
}

/*
 cooldown = 5;
swing_length = 5;
timer = cooldown;