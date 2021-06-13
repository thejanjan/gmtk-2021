/// @description Spawn a powerup from the pool.
// You can write your code in this editor
var powerup = instance_create_layer(x, y, layer, obj_powerup);
powerup.powerup_index = get_pool_powerup();
powerup.image_index = powerup.powerup_index;
instance_destroy();