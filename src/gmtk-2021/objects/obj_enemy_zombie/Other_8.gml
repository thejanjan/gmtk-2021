/// @description Insert description here
// You can write your code in this editor

if current_state == state.moving {
	current_state = state.eating;
}
else if current_state == state.well_fed {
	current_state = state.idle;
}