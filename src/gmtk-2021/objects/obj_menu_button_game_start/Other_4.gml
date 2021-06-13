/// @description Insert description here
// You can write your code in this editor

audio_sound_gain(mus_title_screen, 0, 0);
audio_sound_gain(mus_title_screen, 1, 5000);
audio_play_sound(mus_title_screen, 1, true);

make_new_transition()
obj_top_transition.mode = 1;
obj_top_transition.x = 0;