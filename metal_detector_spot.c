#include "npea00385.h"

// PVars for the moby that hides bolts you can find with the metal detector. We only use bolts
struct MetalDetectorSpotVars {
	char unknown[0x18];
	int bolts;
};

#define coords_map ((char*)0xB00000)

// Original update function for metal detector spot moby. 
#define metal_detector_spot_update_func ((void (*)(struct Moby*))0x3d91b8)

// Hook metal detector spot update function
void _start(struct Moby *self) {	
	if (self->state == 0) {
		// If this metal detector spot moby hasn't been initialized
		struct MetalDetectorSpotVars *vars = (struct MetalDetectorSpotVars *)(self->pvars);
	
		// Multiply the amount of bolts this spot contains
		vars->bolts = vars->bolts * 35;
	}
	
	// Call the original update function to resume normal behavior
	metal_detector_spot_update_func(self);
}