/// @description Draw kart (testing operations

function kart_sprite_index() {
	slice = 360 / 16;
	direction_val = round(((direction + (slice / 2)) mod 360) / slice);
	draw_text(300,20,string(direction)+", "+string(direction_val));
	// 0 is right, 4 is up, 8 is left, 12 is down
	switch (direction_val) {
		case 0:
		case 8:
		case 16:
			return 4;
		case 1:
		case 7:
			return 5;
		case 2:
		case 6:
			return 6;
		case 3:
		case 5:
			return 7;
		case 4:
			return 8;
		case 9:
		case 15:
			return 3;
		case 10:
		case 14:
			return 2;
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
	direction_val = round(((direction + (slice / 2)) mod 360) / slice);
	// 0 is right, 4 is up, 8 is left, 12 is down
	if direction_val >= 5 and direction_val <= 11
		return -1;
	return 1;
}

if mouse_check_button(mb_left) direction -= 4;
else direction += 4;
draw_sprite_ext(sprite_index, kart_sprite_index(), x, y, kart_xscale(), 1, 0, c_white, 1);