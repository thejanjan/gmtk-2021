/// @description Draw HP meter

// DEBUG
var debug = 0;
if debug {
	if new_keyboard_check_pressed(global.binding_debug) and false {
		hp_deal_damage(1);
	}
}

// Adjustment variables
var extra_dist = 16;
var rise_increase = 12;
var invulnerable_offset_width = 2;
var dist_between_my_golf_orbs = 28;
var index_bounce_offset = 40;
var bounce_size = 1;
var bounce_speed = 6000; // Less is faster

if invulnerable invulnerable--;

// Calculate position
if visible y_increase *= 0.9;
var ypos = camera_get_view_y(view_camera[0]) + view_hport[0] + y_increase - extra_dist;
var xpos = camera_get_view_x(view_camera[0]) + gui_bars.bar_width + extra_dist;
var invulnerable_offset = (invulnerable / invulnerable_length) * invulnerable_offset_width;
invulnerable_offset *= sign( (invulnerable mod 2) - 0.5 );
xpos += invulnerable_offset;

// Draw HP meter
var hp_offset = round(bounce_size * sin(degtorad( round(get_timer() / bounce_speed) )));
if not invulnerable
	draw_sprite(sprite_index, 0, xpos, ypos + hp_offset);
else
	draw_sprite(sprite_index, 1, xpos + invulnerable_offset, ypos + hp_offset);

// Draw golfball hp
for (var i = 0; i < maxhp; i++) {
	var empty = hp;
	if i >= empty empty = 1;
	else empty = 0;	
	var bounce_offset = round(bounce_size * sin(degtorad( ((i + 1) * index_bounce_offset) + round(get_timer() / bounce_speed) )));
	draw_sprite(sprite_index, 2 + empty, xpos + (i * dist_between_my_golf_orbs), ypos + bounce_offset);
}

if !instance_exists(path_manager) exit;

// Draw flags collected
var flags = CURRENT_FLAGS;
var max_flags = floor(path_manager.CURRENT_HOLE_COUNT);

var scale = 1;
var kerning = 48 * scale;

extra_dist -= 19;

var ypos = camera_get_view_y(view_camera[0]) + view_hport[0] + y_increase - extra_dist - kerning;
var xpos = camera_get_view_x(view_camera[0]) + view_wport[0] - gui_bars.bar_width - extra_dist;

var symbol = "@";
if flags >= max_flags symbol = "#";

var draw_str = string(flags)+"/"+string(max_flags)+symbol;
var left_slide = string_length(draw_str) * kerning

// draw_text_new(xpos - left_slide, ypos, draw_str, c_white, 0, scale, kerning);

for (var i = 0; i < string_length(draw_str); i++) {
	var bounce_offset = round(bounce_size * sin(degtorad( ((i + 1) * index_bounce_offset) + round(get_timer() / bounce_speed) )));
	var char = string_char_at(draw_str, i + 1);
	
	draw_text_new(round(xpos - left_slide + (i * kerning)), round(ypos + bounce_offset), char, c_white, 0, scale, 0);
}

// Ball letters
if instance_exists(obj_golf_kart)
	if instance_exists(obj_golf_kart.dummy)
		timer = -2;

timer++;
var ball_count = array_length(ball_letters);
if timer = 0 {
	var ballstring = "Hole ";
	var number = ((CURRENT_HOLE - 1) mod 18) + 1;
	var repeated_holes = floor((CURRENT_HOLE - 1) / 18);
	repeat (repeated_holes)
		ballstring += "18 ";
	ballstring += string(number);
	
	// Init ball timer objects	
	for (var i = 0; i < string_length(ballstring); i++) {
		var char = string_char_at(ballstring, i + 1);
		if char = " " {array_push(ball_letters, -4); continue;}
		var ball = instance_create_layer(0, 0, "Instances", obj_ball_letter);
		ball.letter = char
		array_push(ball_letters, ball);
	}
	
} if timer >= 1 {
	// Init ball timer objects	
	// var _cx = camera_get_view_x(view_camera[0]) + (view_wport[0] / 2); //obj_golf_kart.x // 
	// var _y = camera_get_view_y(view_camera[0]) - 32; //obj_golf_kart.y - (view_hport[0] / 2) - 32  //
	var _cx = xpos - (view_wport[0] / 2) + gui_bars.bar_width + extra_dist;
	var _y = ypos - view_hport[0] - y_increase + extra_dist + kerning - 32;
	/*
	var ypos = camera_get_view_y(view_camera[0]) + view_hport[0] + y_increase - extra_dist - kerning;
	var xpos = camera_get_view_x(view_camera[0]) + view_wport[0] - gui_bars.bar_width - extra_dist;
*/
	var dist = 80;
	var timer_move_back = 180;
	var scale = 1;
	var outline = c_black;
	var text = c_white;
	if (ball_count mod 2) = 0
		_cx += dist / 2; // even number offset
	for (var i = 0; i < ball_count; i++) {
		if !instance_exists(ball_letters[i]) continue;
		var o_i = i - floor(ball_count / 2);
		var letter = ball_letters[i].letter;
		var xpos = _cx + (dist * o_i)
		if timer < timer_move_back
			var ypos = _y + min((timer * 4) - (abs(o_i) * 11), 120);
		else
			var ypos = _y + 120 - max(((timer - timer_move_back) * 4) - (abs(o_i) * 11), 0);
		draw_sprite(spr_ball, 4, xpos, ypos);
		draw_text_new_centered(xpos + 23, ypos, letter, text, outline, scale, 48 * scale);
	}
	if timer >= (timer_move_back + 30)  {
		for (var i = 0; i < ball_count - 5; i++) {
			if !instance_exists(ball_letters[i + 5]) continue;
			var extra_dist = 16;
			var letter = ball_letters[i + 5].letter;
			var ypos = camera_get_view_y(view_camera[0]) + view_hport[0] - extra_dist - 100;
			var xpos = camera_get_view_x(view_camera[0]) + gui_bars.bar_width + extra_dist + 31 + (i * dist);
			draw_sprite(spr_ball, 4, xpos, ypos);
			draw_text_new_centered(xpos + 23, ypos, letter, text, outline, scale, 48 * scale);
		}
	}
}

/*
y_increase = 64;
hp = 3;
maxhp = 3;
invulnerable = -1;