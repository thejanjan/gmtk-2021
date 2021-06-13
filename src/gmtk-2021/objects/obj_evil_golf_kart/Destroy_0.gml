/// @description cleanup chain!

for (var i = array_length(chain_link) - 1; i >= 0; i--) {
	if instance_exists(chain_link[i]) {
		with chain_link[i] {
			phy_active = false;
		}
	}
}

event_inherited();

