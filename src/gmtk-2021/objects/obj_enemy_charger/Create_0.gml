/// @description Insert description here
// You can write your code in this editor

enemy_set_starting_hp(70);
event_inherited();

enum charger_state {
	idle,
	warning,
	charging
}

charge_frame = 0;
current_state = charger_state.idle;
alarm[0] = irandom(180);
