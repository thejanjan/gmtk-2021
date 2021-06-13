/// @description cleanup chain!

for (var i = array_length(chain_link) - 1; i >= 0; i--) {
	if instance_exists(chain_link[i]) {
		instance_destroy(chain_link[i]);
	}
}

event_inherited();

