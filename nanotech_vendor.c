#include "npea00385.h"

#define has_premium_nanotech (*((char*)0x0096bff4))
#define has_ultra_nanotech (*((char*)0x0096bff5))

#define show_persistent_message ((int (*)(int, int))0x11aeec)
#define play_ilm ((void (*)(int, int))0x167e60)

#define items_map ((char*)0xB00050)

// This is basically a reimplementation of the Nanotech vendor (on Orxon) update function
//	  with randomizer features obviously. 
// It turned out to be easier to just reimplement it than to try to patch 
//    instructions within the function. 
// Note that this implementation does not give trophies, and it also fixes
//	  a bug in the original game where you actually needed 30001 bolts to buy
//	  the second upgrade, even though the game states you only need 30000. 
void _start(struct Moby* self) {
	// If the player does not have the first Nanotech upgrade. 
	if (items_map[0x34] == 0) {
		if (player_bolts < 4000) {
			// Show a message that you need 4000 bolts to purchase this upgrade. 
			show_persistent_message(1, 0x2720);
		} else {
			// Player has enough bolts to buy, show message that they need to press triangle to purchase. 
			int message_shown = show_persistent_message(1, 0x271e);
			
			if ((pressed_buttons & BTN_TRI) != 0 && message_shown != 0) {
				// Player has pressed triangle so we unlock item, take bolts and play corresponding In-Level Movie (ILM)
				unlock_item(0x34);
				player_bolts -= 4000;
				play_ilm(0, 0);
				
				// After(I think?) the ILM we set Nanotech vendor state back to 1
				self->state = 1;
			}
		}
	} else if (items_map[0x35] == 0 && has_premium_nanotech == 1) {
		if (player_bolts < 30000) {
			// Show a message that you need 30000 bolts to purchase this upgrade. 
			show_persistent_message(1, 0x2721);
		} else {
			// Player has enough bolts to buy, show message that they need to press triangle to purchase. 
			int message_shown = show_persistent_message(1, 0x271f);
			
			if ((pressed_buttons & BTN_TRI) != 0 && message_shown != 0) {
				// Player has pressed triangle so we unlock item, take bolts and play corresponding In-Level Movie
				unlock_item(0x35);
				player_bolts -= 30000;
				play_ilm(1, 0);
				
				// After(I think?) the ILM we set Nanotech vendor state back to 1
				self->state = 1;
			}
		}
	}
	
	return;
}