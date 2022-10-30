#include "npea00385.h"


// The Trespasser and Hydrodisplacer share an update function. 
// So this hook is necessary to properly remove it from the level if the player already has the item. 
// They differ by oClass, so it's possible to know which is which. 


#define items_map ((char*)0xB00050)
#define item_replacements ((char*)0xB00100)

#define special_items ((char*)0x96bff0)	

#define toast_message ((void (*)(unsigned int, int))0x112a38)

#define coords_map ((char*)0xB00000)

#define orig_update_func ((void (*)(struct Moby*))0x0183880)

// Hook Trespasser/Hydrodisplacer update function
void _start(struct Moby *self) {
	// If item is not yet initialized. 
	if (self->state == 0) {
		if (self->oClass == 0x3ed) {  // Trespasser
			if (items_map[0x1a] == 1) {
				// If we already have it, delete it. 
				delete_moby(self);
				return;
			}
		} else {  // Hydrodisplacer
			if (items_map[0x16] == 1) {
				// If we already have it, delete it. 
				delete_moby(self);
				return;
			}
		}
	}
	
	// Call original update func to resume normal operation of the item. 
	orig_update_func(self);
}