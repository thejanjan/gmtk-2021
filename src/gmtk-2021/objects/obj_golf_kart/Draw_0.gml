/// @description Draw kart (testing operations

function kart_sprite_index() {
	slice = 360 / 16;
	direction_val = round((current_direction mod 360) / slice);
	// draw_text_new(300,20,string(current_direction)+"/"+string(direction_val), c_lime, c_blue, 1, 48);
	// draw_text_new(300,50,string(dir_vector[0])+"/"+string(dir_vector[1]), c_red, c_black, 0.5, 24);
	// draw_text_new(300,80,"the quick brown fox jumped over the lazy dog", c_black, c_white, 0.33, 48/3);
	// draw_text(300,60,"speed: " + string(phy_speed_x) + ", " + string(phy_speed_y));
	// 0 is right, 4 is up, 8 is left, 12 is down
	switch (direction_val) {
		case 0:
		case 8:
		case 16:
			return 4;
		case 1:
		case 7:
			return 2;
		case 2:
		case 6:
			return 5;
		case 3:
		case 5:
			return 7;
		case 4:
			return 8;
		case 9:
		case 15:
			return 6;
		case 10:
		case 14:
			return 3;
		case 11:
		case 13:
			return 1;
		case 12:
			return 0;
	}
	return 0;
	// show_error("kart_sprite_index messed up somehow", true);
}

function kart_xscale() {
	slice = 360 / 16;
	direction_val = round(((current_direction + (slice / 2)) mod 360) / slice);
	// 0 is right, 4 is up, 8 is left, 12 is down
	if direction_val >= 5 and direction_val <= 11
		return -1;
	return 1;
}

x_car_offset *= reduce_offset;

if x_car_offset < -1 {
	current_direction = 0;
	dummy.x = x + x_car_offset;
	dummy.y = y;
} else if instance_exists(dummy) {
	with (dummy) instance_destroy();
	camera_make([-1, -1]);
	if instance_number(hp_bar) = 0
		instance_create_layer(0, 0, "Instances", hp_bar);	
}

draw_sprite_ext(sprite_index, kart_sprite_index(), x + x_car_offset, y + y_offset, kart_xscale(), 1, 0, image_blend, image_alpha);

var _obj = self;
if instance_exists(dummy) _obj = dummy;
var camera_x, camera_y;
camera_x = _obj.x;
camera_y = _obj.y;

if global.camera_shake > 0 {
	camera_x += random_range(-global.camera_shake, global.camera_shake);
	camera_y += random_range(-global.camera_shake, global.camera_shake);
	global.camera_shake *= 0.7;
}

camera_obj.x = camera_x;
camera_obj.y = camera_y;

// DEBUG: shows the vector to the crosshair
// var vector_draw_dist = 60;
// draw_line(x, y, x + (dir_vector[0] * vector_draw_dist), y + (dir_vector[1] * vector_draw_dist));
// draw_sprite(spr_crosshair, 0, goal[0], goal[1]);