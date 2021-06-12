/// @description Draw golfer facing the nearest chain

function golfer_get_index() {
	var direction_facing = point_direction(x, y, attachment_target.x, attachment_target.y) mod 360;
	var slice = 360 / 8;
	var segment = round((direction_facing / slice));
	draw_text(400, 20, string(segment) + ", " + string(slice) + ", ");
	switch (segment) {
		case 0:
		case 8:
			return [2, 1];
		case 1:
			return [1, 1];
		case 2:
			return [0, 1];
		case 3:
			return [1, -1];
		case 4:
			return [2, -1];
		case 5:
			return [3, -1];
		case 6:
			return [4, 1];
		case 7:
			return [3, 1];
	}
	return [0, 1];
}

var draw_array = golfer_get_index();
image_index = draw_array[0];
image_xscale = draw_array[1];
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_white, 1);