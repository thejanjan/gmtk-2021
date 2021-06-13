/// @description Insert description here
// You can write your code in this editor

// squashes and stretches points
function squash_n_stretch_transform(v) {
	var vx = phy_speed_x;
	var vy = phy_speed_y;
	var vx2 = vx * vx;
	var vy2 = vy * vy;
	squash_factor = 1 - clamp((vx2 + vy2) * .01, 0, .25);
	stretch_factor = 1 + clamp((vx2 + vy2) * .01, 0, .25);
	var a = v[0] - x;
	var b = v[1] - y;
	var tx = ( b*(-squash_factor + stretch_factor) * vx * vy + 
	           a*(stretch_factor * vx2 + squash_factor * vy2) )
			   / ( vx2 + vy2 );
	var ty = ( a*(-squash_factor + stretch_factor) * vx * vy + 
	           b*(squash_factor * vx2 + stretch_factor * vy2) )
			   / ( vx2 + vy2 );
	return [tx + x, ty + y];
}


if weak {
	image_index = 0;
	draw_sprite_ext(sprite_index, 6, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
} else draw_sprite_ext(sprite_index, get_ball_shadow_index(), x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

if (!phy_sleeping and os_browser != browser_not_a_browser) {
	var hw = 12;
	var hh = 12;
	var topleft = squash_n_stretch_transform([x - hw , y - hh]);
	var topright = squash_n_stretch_transform([x + hw, y - hh]);
	var bottomright = squash_n_stretch_transform([x + hw , y + hh]);
	var bottomleft = squash_n_stretch_transform([x - hw, y + hh]);

	draw_sprite_pos(sprite_index, -1, topleft[0], topleft[1], 
									  topright[0], topright[1], 
									  bottomright[0], bottomright[1],
									  bottomleft[0], bottomleft[1], 1);								  
}
else {
	draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}