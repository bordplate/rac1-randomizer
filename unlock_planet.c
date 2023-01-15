#include "npea00385.h"


// We hook the "unlock_planet" function to give the player the randomized planet
//     instead of the original one. 


struct InfobotVars {
	int something;
	int planet;
};

// This coords_map is populated by the Lua automation script. 
#define coords_map ((char*)0xB00000)

register unsigned int r3 asm("r3");

_Noreturn void _start() {
	if (r3 == 1 || r3 == current_planet || r3 == destination_planet) {
		// If the planet to unlock is the current planet or where we're going, we just jump to the original
		//     "unlock_planet" function. 
		// Also if the planet to unlock is Novalis? Not sure why we check `r3 == 1` here, but I'm sure it's crucial. 
		asm("ba 0x112c24");
	}
	
	// Using the original planet ID, we look up what it's been randomized to. 
	// If for example the original planet to unlock is ID 2, we check this map at index 2,
	//     and that tells us what that planet has been randomized to. 
	r3 = coords_map[r3];
	
	// Continue the original "unlock_planet" function. 
	asm("ba 0x112c24");
}