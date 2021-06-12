/// @description Draw golfer sprite (STOP VANISHING)

// todo: flicker
var facing = image_angle;
var slices = 16; // Round the facing by this amount
if attachment_target = -1 {
	if instance_exists(obj_chain_link) {
		var nearest_chain = instance_nearest(x, y, obj_chain_link);
		facing = point_direction(x, y, nearest_chain.x, nearest_chain.y);	
	}
} else {
	facing = point_direction(x, y, attachment_target.x, attachment_target.y);	
}

facing = round(facing / slices) * slices;

draw_sprite_ext(sprite_index, 1, x, y, 1, 1, facing, c_white, 1);