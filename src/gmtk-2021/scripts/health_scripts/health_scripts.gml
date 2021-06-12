// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function hp_deal_damage(_hp){
	if !hp_bar_exists() return;
	if hp_bar.invulnerable > 0 return;
	hp_bar.hp -= _hp;
	hp_bar.invulnerable = hp_bar.invulnerable_length;
	if hp_bar.hp <= 0 hp_dead();
}

function hp_bar_exists() {
	return instance_exists(hp_bar);	
}

function hp_increase_maxhp(_amount) {
	if !hp_bar_exists() return;
	hp_bar.invulnerable = 0;
	hp_bar.maxhp += _amount;
	hp_bar.hp = hp_bar.maxhp;
}

function hp_dead() {
	// todo	
}