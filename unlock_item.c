#include "npea00385.h"

#define items_map ((char*)0xB00050)
#define item_replacements ((char*)0xB00100)
#define vendor_items ((char*)0xB00150)

#define special_items ((char*)0x96bff0)

#define unlock_item_trampoline ((void (*)(int, int))0x4f8ff8)

#define toast_message ((void (*)(unsigned int, int))0x112a38)

#define max_health (*((int*)0x71fb28))

// Special items:
// 	48: Zoomerator
// 	49: Raritanium
// 	50: Codebot
// 	51: ???
// 	52: Premium nanotech
//  53: Ultra nanotech

void _start(int placeholder_item, int equipped) {
	int item = (int)(item_replacements[placeholder_item]);
	
	if (vendor_items[placeholder_item] == 1 || item == 0) {
		item = placeholder_item;
	}
	
	
	
	// Ignore weapons IDs between 9 and 0x19 (weapons), except Swingshot and Hydrodisplacer
	//if (placeholder_item != 0xc && placeholder_item != 0x16 &&
	//	placeholder_item >= 0x9 && placeholder_item <= 0x19) {
	//	item = placeholder_item;
	//}
	
	items_map[placeholder_item] = 1;
	
	if (item <= 36) {
		unlock_item_trampoline(item, 1);
	}
	
	if (item >= 48) {
		special_items[item-48] = 1;
		
		if (item == 0x34 && max_health < 5) {
			max_health = 5;
		}
		
		if (item == 0x35) {
			max_health = 8;
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