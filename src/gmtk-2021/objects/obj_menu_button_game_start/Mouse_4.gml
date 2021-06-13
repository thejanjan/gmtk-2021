/// @description Insert description here
// You can write your code in this editor

if not does_transition_exist() {
	make_new_transition();
	audio_sound_gain(mus_title_screen, 0, 1000 * (obj_top_transition.duration / 60));
}