/// @description Insert description here
// You can write your code in this editor
event_inherited();
if instance_exists(obj_golfer) {
	
if awake = 0 and vector_distance([x, y], [obj_golfer.x, obj_golfer.y]) <= 300 {
	awake = 0.5;
}
if (awake = 0.5) {
	t++;	
}
if t == 15 {
	awake = 1;
}
if awake == 1 {
	phy_active = true;
	t++;
	if t > 19 {
		t = 15;
	}
	impulse_towards([obj_golfer.x, obj_golfer.y], 30)
}

}