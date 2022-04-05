#include "npea00385.h"

#define items_map ((char*)0xB00050)
#define item_replacements ((char*)0xB00100)
#define vendor_items ((char*)0xB00150)

#define special_items ((char*)0x96bff0)

#define unlock_item_trampoline ((void (*)(int, int))0x4f8ff8)

#define toast_message ((void (*)(unsigned int, int))0x112a38)

#define max_health (*((int*)0x71fb28))
#define game_state (*((int*)0x00A10708))

#define blarg_bridge_extended (*((char*)0x0a0cae5))
#define has_premium_nanotech (*((char*)0x0096bff4))

// Special items:
// 	48: Zoomerator
// 	49: Raritanium
// 	50: Codebot
// 	51: ???
// 	52: Premium nanotech
//  53: Ultra nanotech

void _start(int placeholder_item, int equipped) {
	int item = (int)(item_replacements[placeholder_item]);
	
	// If game state is in vendor
	if ((vendor_items[placeholder_item] == 1 && game_state == 5) || item == 0) {
		item = placeholder_item;
	} else {
		items_map[placeholder_item] = 1;
	}
	
	// Fix some stuff that unlocking O2 mask makes impossible to get casually
	if (item == 6) {
		blarg_bridge_extended = -1;  // Extend bridge on Blarg so it's easy to get Hydrodisplacer as Ratchet
	}
	
	if (item <= 36) {
		unlock_item_trampoline(item, 1);
	}
	
	if (item >= 48) {
		special_items[item-48] = 1;
		
		if (item == 0x34 && max_health < 5) {
			max_health += 1;
			player_health = max_health;
		}
		
		if (item == 0x35) {
			max_health += 3;
			player_health = max_health;
		}
		
		unsigned int message = 0;
		
		switch (item) {
			case 0x30: 
				message = 0x1395;
				break;
			case 0x31:
				message = 0x2ee7;
				break;
			case 0x32:
				message = 0x426a;
				break;
			case 0x34:
				message = 0x271c;
				break;
			case 0x35:
				message = 0x271d;
				break;
		}
		
		toast_message(message, -1);
	}
	
	return;
}