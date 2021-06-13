/// @description Insert description here
// You can write your code in this editor
if alpha > 0.0 {
	alpha -= 0.03;
	image_alpha = max(alpha, 1.0);
} else {
	instance_destroy();
}
y -= 3;

if instance_number(obj_rising_text) >= 2 {
	var self_val = get_rising_text_val(self);
	if self_val != -1 {
		var check_dist = 16;
		y -= check_dist;
		var nearest_text = instance_nearest(x, y + check_dist, obj_rising_text);
		y += check_dist;
		if instance_exists(nearest_text) {
			var near_val = get_rising_text_val(nearest_text);
			if near_val >= 0 {
				if id > nearest_text.id {
					str = "-" + string(self_val + near_val);
					with (nearest_text) instance_destroy();
				}
			}
		}
	}
}