#include "npea00385.h"


// If the player gets the O2 Mask before visiting Orxon as Clank
//     the gates on Orxon are closed, and it's not possible to progress
//     without using glitches or speedrunning tech.
// This is a common update function for those gates to force them open if
//     the player has the O2 mask. 


#define o2mask (*((char*)0x0096c146))

#define orxon_clank_openable_doors_update_func ((void (*)(struct Moby*))0x187b68)
#define orxon_bar_gates_update_func ((void (*)(struct Moby*))0x27a488)
#define orxon_clank_section_gate ((void (*)(struct Moby*))0x2732f8)


void _start(struct Moby *self) {
	// Check if the player has the O2 mask
	if (o2mask != 0 && self->state != 0 && self->pvars[19] != 1) {
		// The gates are not initialized yet and the player has the O2 mask. 
		if (self->oClass == 0x590) {
			// If this gate is the "bar gates", then we just set the Z-position to 200. 
			// This was easier than trying to figure out how the game normally opens them. 
			// Casualy players shouldn't really see the difference anyway. 
			(self->pos).z = 200;
		} else {
			// If this is any of the other 2 gate types, set state to 3 to open them. 
			self->state = 3;
		}
		
		self->pvars[19] = 1;
	}
	
	
	// Call the relevant original update function for this gate.
	switch(self->oClass) {
		case 0x3f7:
			orxon_clank_openable_doors_update_func(self);
			break;
		case 0x58d:
			orxon_clank_section_gate(self);
			break;
		case 0x590:
			orxon_bar_gates_update_func(self);
			break;
	}
}