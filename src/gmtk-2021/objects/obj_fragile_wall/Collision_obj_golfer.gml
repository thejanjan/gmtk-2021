/// @description Destroy self if the golfer is moving fast enough.
// You can write your code in this editor
if other.current_speed > 10 {
	instance_destroy();
}