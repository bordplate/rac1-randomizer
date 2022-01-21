#include "npea00385.h"

#define coords_map ((char*)0xB00000)

register unsigned int r3 asm("r3");

_Noreturn void _start() {
	if (r3 == 1 || r3 == current_planet || r3 == destination_planet) {
		asm("ba 0x112af4");
	}
	
	r3 = coords_map[r3];
	
	asm("ba 0x112af4");
}