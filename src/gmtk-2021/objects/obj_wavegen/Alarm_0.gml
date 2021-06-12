/// @description Insert description here
// You can write your code in this editor
enemy_difficulties = split_into_random_summands(current_difficulty, max_enemies_spawned_per_wave);
for (var i=0; i<array_length_1d(enemy_difficulties); i++)
{
	var enemy_type = get_enemy_from_difficulty(enemy_difficulties[i]);
	instance_create_layer(64, 64, layer, enemy_type);
}
current_difficulty += difficulty_increase_per_wave;

alarm[0] = time_between_waves;