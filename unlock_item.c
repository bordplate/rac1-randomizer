#include "npea00385.h"


// We need to hook the "unlock_item" function to give the player the 
//     randomized item. 


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
		// If player got the O2 mask, we need to extend the bridge on Blarg Station that leads to the Hydrodisplacer
		//     because it's not possible to play the area as Clank when you have the O2 mask. 
		// It's also not possible to do the Clank route as Ratchet, because you need to open some gates
		// 	   that you need to use those small Clank bots to open. 
		blarg_bridge_extended = -1;  // Yes, -1 (or 0xff if you will) extends the bridge, idk why. 
	}
		
	if (item <= 0x24) {
		// If the item ID is less than 36 we can call the original unlock_item function. 
		unlock_item_trampoline(item, 1);
	}
	
	if (item >= 0x30) {
		// These items require special coding.
		special_items[item-0x30] = 1;
		
		// First Nanotech upgrade
		if (item == 0x34) {
			max_health += 1;
			player_health = max_health;
		}
		
		// Second Nanotech upgrade
		if (item == 0x35) {
			max_health += 3;
			player_health = max_health;
		}
		
		unsigned int message = 0;
		
		// For these other items we just want to show the right toast message.
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
		
		// Show relevant toast message to player. 
		toast_message(message, -1);
	}
	
	return;
}