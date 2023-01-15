#include "npea00385.h"

// This hook just shows the correct message for which planet we unlocked.

#define coords_map ((char*)0xB00000)

register unsigned int r3 asm("r3");

// This works the same as our `unlock_planet` hook. Look at that for more details.
_Noreturn void _start() {
	if (r3 == 1 || r3 == current_planet || r3 == destination_planet) {
		asm("ba 0x112af4");
	}
	
	r3 = coords_map[r3];
	
	asm("ba 0x112af4");
}