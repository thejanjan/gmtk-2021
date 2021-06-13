/// @description Insert description here
// You can write your code in this editor

// IT'S TRAIL TIME
// Treads
if(!surface_exists(tread_surface))
{
   tread_surface = surface_create( room_width, room_height );
}
surface_set_target( tread_surface );

draw_set_color(c_black);
if point_distance(0, 0, obj_golf_kart.phy_speed_x, obj_golf_kart.phy_speed_y) >= 40 or true
{
	var shortangle = 90-0; // Turns out this sucked
	var longangle = 180-shortangle;
	var lowering = 22;
	var dis = 25;
	var dir = -obj_golf_kart.phy_rotation+(shortangle/2);
	var radius = 3;
	draw_circle(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), radius, false);
	draw_line_width(obj_golf_kart.x+lengthdir_x(dis, dir), obj_golf_kart.y+lowering+lengthdir_y(dis, dir), obj_golf_kart.xprevious+lengthdir_x(dis, dir), obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius*2);
	draw_circle(obj_golf_kart.xprevious+lengthdir_x(dis, dir),obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius, false);
	dir += longangle;
	draw_circle(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), radius, false);
	draw_line_width(obj_golf_kart.x+lengthdir_x(dis, dir), obj_golf_kart.y+lowering+lengthdir_y(dis, dir), obj_golf_kart.xprevious+lengthdir_x(dis, dir), obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius*2);
	draw_circle(obj_golf_kart.xprevious+lengthdir_x(dis, dir),obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius, false);
	dir += shortangle;
	draw_circle(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), radius, false);
	draw_line_width(obj_golf_kart.x+lengthdir_x(dis, dir), obj_golf_kart.y+lowering+lengthdir_y(dis, dir), obj_golf_kart.xprevious+lengthdir_x(dis, dir), obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius*2);
	draw_circle(obj_golf_kart.xprevious+lengthdir_x(dis, dir),obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius, false);
	dir += longangle;
	draw_circle(obj_golf_kart.x+lengthdir_x(dis, dir),obj_golf_kart. y+lowering+lengthdir_y(dis, dir), radius, false);
	draw_line_width(obj_golf_kart.x+lengthdir_x(dis, dir), obj_golf_kart.y+lowering+lengthdir_y(dis, dir), obj_golf_kart.xprevious+lengthdir_x(dis, dir), obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius*2);
	draw_circle(obj_golf_kart.xprevious+lengthdir_x(dis, dir),obj_golf_kart.yprevious+lowering+lengthdir_y(dis, dir), radius, false);
};

surface_reset_target();
draw_set_color(c_white);
draw_surface_ext(tread_surface, 0, 0, 1, 1, 0, c_white, 0.2);

// Hole surface
if(!surface_exists(hole_surface))
{
   hole_surface = surface_create( room_width, room_height );
}
surface_set_target( hole_surface );

draw_set_color(make_color_rgb(59, 31, 4));
if point_distance(0, 0, obj_golfer.phy_speed_x, obj_golfer.phy_speed_y) >= 8
{
    var lowering = 10;
	var radius = 20;
	draw_circle(obj_golfer.x, obj_golfer.y+lowering, radius, false);
	draw_line_width(obj_golfer.x, obj_golfer.y+lowering, obj_golfer.xprevious, obj_golfer.yprevious+lowering, radius*2);
	draw_circle(obj_golfer.xprevious, obj_golfer.yprevious+lowering, radius, false);
};

surface_reset_target();
draw_set_color(c_white);
draw_surface(hole_surface, 0, 0);

// Deep hole surface
if(!surface_exists(deep_hole_surface))
{
   deep_hole_surface = surface_create( room_width, room_height );
}
surface_set_target( deep_hole_surface );

draw_set_color(make_color_rgb(39, 21, 4));
draw_set_alpha(1);
if point_distance(0, 0, obj_golfer.phy_speed_x, obj_golfer.phy_speed_y) >= 8
{
    var lowering = 10;
	var radius = 14;
	draw_circle(obj_golfer.x, obj_golfer.y+lowering, radius, false);
	draw_line_width(obj_golfer.x, obj_golfer.y+lowering, obj_golfer.xprevious, obj_golfer.yprevious+lowering, radius*2);
	draw_circle(obj_golfer.xprevious, obj_golfer.yprevious+lowering, radius, false);
};

surface_reset_target();
draw_set_color(c_white);
draw_surface(deep_hole_surface, 0, 0);


draw_set_color(c_white);