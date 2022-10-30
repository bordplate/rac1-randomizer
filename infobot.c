#include "npea00385.h"


// We need to hook the update function of infobots to make them give randomized planets. 


// PVars for infobots. We only use planet atm. 
struct InfobotVars { 
	int unk;
	int planet;
};

#define coords_map ((char*)0xB00000)

#define infobot_update_func ((void (*)(struct Moby*))0x44b5f0)

// Hook for infobot update function. 
void _start(struct Moby *self) {
	// If the object has not been initialized yet
	if (self->state == 0) {
		struct InfobotVars *vars = (struct InfobotVars *)(self->pvars);
	
		// Update which planet this infobot gives you access to based on
		// 	 data populated by the randomizer.
		vars->planet = coords_map[vars->planet];
	}
	
	// Call the original infobot update function. 
	infobot_update_func(self);
}