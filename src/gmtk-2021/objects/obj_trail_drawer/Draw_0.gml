/// @description Insert description here
// You can write your code in this editor

// IT'S TRAIL TIME

if new_keyboard_check_pressed(global.binding_toggle_trails)
{
	global.trails_activated = not global.trails_activated;
}

// Treads
if global.trails_activated
{
	if(!surface_exists(tread_surface))
	{
		var dim = make_surface_dimensions();
		tread_surface = surface_create( dim[0], dim[1] );
	}
	surface_set_target( tread_surface );

	draw_set_color(c_black);
}

if point_distance(0, 0, obj_golf_kart.phy_speed_x, obj_golf_kart.phy_speed_y) >= 1
{
	var shortangle = 90-0; // Turns out this sucked
	var longangle = 180-shortangle;
	var lowering = 22;
	var dis = 25;
	var dir = -obj_golf_kart.phy_rotation+(shortangle/2);
	var radius = 3;
	
	if global.player_fire_trails >= 1
	{
		instance_create_depth(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), 1, obj_fire_trail);
	};
	
	if global.trails_activated
	{
		draw_circle(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), radius, false);
		draw_line_width(obj_golf_kart.x+lengthdir_x(dis, dir), obj_golf_kart.y+lowering+lengthdir_y(dis, dir), obj_golf_kart.xprevious+lengthdir_x(dis, dir), obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius*2);
		draw_circle(obj_golf_kart.xprevious+lengthdir_x(dis, dir),obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius, false);
	}
	
	dir += longangle;
	if global.player_fire_trails >= 2
	{
		instance_create_depth(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), 1, obj_fire_trail);
	};
	
	if global.trails_activated
	{
		draw_circle(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), radius, false);
		draw_line_width(obj_golf_kart.x+lengthdir_x(dis, dir), obj_golf_kart.y+lowering+lengthdir_y(dis, dir), obj_golf_kart.xprevious+lengthdir_x(dis, dir), obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius*2);
		draw_circle(obj_golf_kart.xprevious+lengthdir_x(dis, dir),obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius, false);
	}
	
	dir += shortangle;
	if global.player_fire_trails >= 3
	{
		instance_create_depth(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), 1, obj_fire_trail);
	};
	
	if global.trails_activated
	{
		draw_circle(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), radius, false);
		draw_line_width(obj_golf_kart.x+lengthdir_x(dis, dir), obj_golf_kart.y+lowering+lengthdir_y(dis, dir), obj_golf_kart.xprevious+lengthdir_x(dis, dir), obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius*2);
		draw_circle(obj_golf_kart.xprevious+lengthdir_x(dis, dir),obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius, false);
	}
	dir += longangle;
	if global.player_fire_trails >= 4
	{
		instance_create_depth(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), 1, obj_fire_trail);
	};
	
	if global.trails_activated
	{
		draw_circle(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), radius, false);
		draw_line_width(obj_golf_kart.x+lengthdir_x(dis, dir), obj_golf_kart.y+lowering+lengthdir_y(dis, dir), obj_golf_kart.xprevious+lengthdir_x(dis, dir), obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius*2);
		draw_circle(obj_golf_kart.xprevious+lengthdir_x(dis, dir),obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius, false);
	};
};

if global.trails_activated
{
	surface_reset_target();
	draw_set_color(c_white);
	if(surface_exists(tread_surface))
	{
		draw_surface_ext(tread_surface, 0, 0, 1, 1, 0, c_white, 0.2);
	}
}

// Figuring out hole sizes
var lesser_face_grind_threshhold = 4.5;
var face_grind_threshhold = 15;
var min_brushstroke_size = 3;

var golfer_speed;
if instance_exists(obj_golfer) {
	golfer_speed = min(20, point_distance(0, 0, obj_golfer.phy_speed_x, obj_golfer.phy_speed_y));
} else {
	golfer_speed = 0;
}
var deep_hole_radius = (golfer_speed-lesser_face_grind_threshhold)*1;
var hole_radius = deep_hole_radius+((golfer_speed-face_grind_threshhold)*1.2);

// Hole surface
if global.trails_activated
{
	if(!surface_exists(hole_surface))
	{
		var dim = make_surface_dimensions();
		hole_surface = surface_create( dim[0], dim[1] );
	}
	surface_set_target( hole_surface );
	
	draw_set_color(make_color_rgb(59, 31, 4));
};

if hole_radius >= min_brushstroke_size
{
    var lowering = 10;
	if global.player_fire_trails >= 5
	{
		instance_create_depth(obj_golfer.x, obj_golfer.y+lowering, 1, obj_fire_trail);
	};
	
	if global.trails_activated
	{
		draw_circle(obj_golfer.x, obj_golfer.y+lowering, hole_radius, false);
		draw_line_width(obj_golfer.x, obj_golfer.y+lowering, obj_golfer.xprevious, obj_golfer.yprevious+lowering, hole_radius*2);
		draw_circle(obj_golfer.xprevious, obj_golfer.yprevious+lowering, hole_radius, false);
	};
};

if global.trails_activated
{
	surface_reset_target();
	draw_set_color(c_white);
	if(surface_exists(hole_surface))
	{
		draw_surface(hole_surface, 0, 0);
	}

	// Deep hole surface
	if(!surface_exists(deep_hole_surface))
	{
		var dim = make_surface_dimensions();
		deep_hole_surface = surface_create( dim[0], dim[1] );
	}
	surface_set_target( deep_hole_surface );

	draw_set_color(make_color_rgb(39, 21, 4));
	draw_set_alpha(1);
	if deep_hole_radius >= min_brushstroke_size
	{
	    var lowering = 10;
		draw_circle(obj_golfer.x, obj_golfer.y+lowering, deep_hole_radius, false);
		draw_line_width(obj_golfer.x, obj_golfer.y+lowering, obj_golfer.xprevious, obj_golfer.yprevious+lowering, deep_hole_radius*2);
		draw_circle(obj_golfer.xprevious, obj_golfer.yprevious+lowering, deep_hole_radius, false);
	};

	surface_reset_target();
	draw_set_color(c_white);
	if(surface_exists(deep_hole_surface))
	{
		draw_surface(deep_hole_surface, 0, 0);
	}

	draw_set_color(c_white);
};