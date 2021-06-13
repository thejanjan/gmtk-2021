/// @description DEBUG

if new_keyboard_check_pressed(global.binding_debug) and false {
	audio_stop_all();
	if room = gameplay_testing
		room_goto(main_game);
	else
		room_goto(gameplay_testing);
}