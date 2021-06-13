/// @description Insert description here
// You can write your code in this editor
event_inherited();
enemy_set_starting_hp(150);

enum charger_state {
	idle,
	warning,
	charging
}

current_state = charger_state.idle;
alarm[0] = 60;