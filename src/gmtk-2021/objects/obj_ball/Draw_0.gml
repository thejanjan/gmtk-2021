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

var golfball_shadow_max_height = 140;
var shadow_scale = max(0.3, 1 - (real_y / golfball_shadow_max_height));
var shadow_alpha = max(0.3, 1 - (real_y / golfball_shadow_max_height));
var golfball_shadow_height = 10;
switch (global.growth_spurt) {
	case 1:
		golfball_shadow_height = 14; break;
	case 2:
		golfball_shadow_height = 18; break;
	case 3:
		golfball_shadow_height = 26; break;
	case 4:
		golfball_shadow_height = 34; break;
	case 5:
		golfball_shadow_height = 42; break;
}

golfball_shadow_height *= (1 - shadow_scale) * image_xscale;
golfball_shadow_height = floor(golfball_shadow_height);

if weak {
	image_index = 0;
	draw_sprite_ext(sprite_index, 6, x, y + golfball_shadow_height, image_xscale * shadow_scale, image_yscale * shadow_scale, 0, c_white, image_alpha * shadow_alpha);
} else draw_sprite_ext(sprite_index, get_ball_shadow_index(), x, y + golfball_shadow_height, image_xscale * shadow_scale, image_yscale * shadow_scale, 0, c_white, image_alpha * shadow_alpha);

if (!phy_sleeping and os_browser != browser_not_a_browser) {
	var hw = 12;
	var hh = 12;
	var topleft = squash_n_stretch_transform([x - hw , y - hh]);
	var topright = squash_n_stretch_transform([x + hw, y - hh]);
	var bottomright = squash_n_stretch_transform([x + hw , y + hh]);
	var bottomleft = squash_n_stretch_transform([x - hw, y + hh]);

	draw_sprite_pos(sprite_index, -1, topleft[0], topleft[1] - real_y, 
									  topright[0], topright[1] - real_y, 
									  bottomright[0], bottomright[1] - real_y,
									  bottomleft[0], bottomleft[1] - real_y, 1);								  
}
else {
	draw_sprite_ext(sprite_index, -1, x, y - real_y, image_xscale, image_yscale, _angle, c_white, image_alpha);
}