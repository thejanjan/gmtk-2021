/// @description Draw HP meter

// DEBUG
var debug = 0;
if debug {
	if new_keyboard_check_pressed(global.binding_debug) {
		hp_deal_damage(1);
	}
}

// Adjustment variables
var extra_dist = 16;
var rise_increase = 4;
var invulnerable_offset_width = 2;
var dist_between_my_golf_orbs = 28;
var index_bounce_offset = 40;
var bounce_size = 1;
var bounce_speed = 6000; // Less is faster

if invulnerable invulnerable--;

// Calculate position
if visible y_increase /= rise_increase;
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

/*
y_increase = 64;
hp = 3;
maxhp = 3;
invulnerable = -1;