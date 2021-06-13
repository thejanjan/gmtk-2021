/// @description Insert description here
// You can write your code in this editor

move += sign(move) * random_range(0.01, 0.02);
ymove += sign(move) * random_range(0.006, 0.009);
x += move;
y += ymove;
image_xscale -= 0.01;
image_yscale = image_xscale
;if image_xscale <= 0 instance_destroy();