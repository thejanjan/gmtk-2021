/// @description Screen size handler

if new_keyboard_check_pressed(global.binding_toggle_fullscren) {
	var current_screen = window_get_fullscreen();
	window_set_fullscreen(not current_screen);
	
	if not current_screen
		// Fullscreen
		var new_size = [display_get_width(), display_get_height()];
	else
		// Windowed
		var new_size = [1366, 768];
	
	window_set_size(new_size[0], new_size[1]);
	if room != main_game exit;
	view_set_wport(0, new_size[0]);
	view_set_hport(0, new_size[1]);
	camera_set_view_size(view_camera[0], new_size[0], new_size[1]);
	view_wport[0] = new_size[0];
	view_hport[1] = new_size[1];
	camera_make(new_size);
	camera_set_view_size(view_camera[0], new_size[0], new_size[1]);
	view_set_camera(0, view_camera[0]);
	view_set_wport(0, new_size[0]);
	view_set_hport(0, new_size[1]);
}