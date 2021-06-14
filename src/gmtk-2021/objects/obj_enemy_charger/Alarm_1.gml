/// @description Insert description here
// You can write your code in this editor
if current_state != charger_state.warning exit;
current_state = charger_state.charging;
image_blend = c_red;
alarm[2] = 60;