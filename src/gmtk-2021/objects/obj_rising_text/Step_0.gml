/// @description Insert description here
// You can write your code in this editor
if alpha > 0.0 {
	alpha -= 0.03;
	image_alpha = max(alpha, 1.0);
} else {
	instance_destroy();
}
y -= 3;