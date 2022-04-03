#define somethingidk (*((int*)0x0096ad70))

#define somethingelse (*((int*)0x0096ad70))

#define swap_to (*((int*)0x0096bdb4))
#define current_weapon (*((int*)0x00969c7c))

#define last_valid_weapon (*((int*)0xB00500))
#define item_replacements ((char*)0xB00100)

// This is all some super hacky shit to avoid a crash when you buy unsupported stuff from a vendor, I'm sorry.

void _start() {
	if (somethingidk != 0) {
		return;
	}
	
	switch (swap_to) {
		case 0x1c: // Mangeboots
		case 0x1d: // Grindboots
		case 0x1e: // Hoverboard
		case 0x21: // MapOMatic
		case 0x22: // Bolt Grabber
		case 0x23: // Persuader
			swap_to = last_valid_weapon;
			current_weapon = last_valid_weapon;
			break;
		default:
			last_valid_weapon = current_weapon;
	}
	
	if (somethingidk != 0) {
		return;
	}
	
	asm("ori 0, 0, 0");
	
	return;
}