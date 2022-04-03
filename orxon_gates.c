#include "npea00385.h"

struct Moby {
    // The moby position for collision purposes. Usually should not be touched.
    vec4 coll_pos;
    // The moby position.
    vec4 pos;
    // The moby state.
    char state;
    // The texture mode.
    char texture_mode;
    // The moby opacity.
    unsigned short opacity;
    // The moby model.
    void* model;
    // The parent moby, if existing.
    struct moby* parent;
    // The 3D scaling applied to the model.
    float scale;
    // Unknown, 0x30
    char unk_30;
    // Whether or not the moby is visible (readonly).
    char visible;
    // The distance at which the moby will start fading out.
    short render_distance;
    // Unknown, 0x34
    void* unk_34;
    // Controls the coloring of the moby.
    color color;
    // Controls the shading of the moby, through mechanisms unknown.
    unsigned int shading;
    // The moby rotation in radians. Typically only Z needs to be changed.
    vec4 rot;
    // The previous frame number of the current animation.
    char prev_anim_frame;
    // The current frame number of the current animation.
    char curr_anim_frame;
    // asdf
    char asdf[0x26];
    // The moby's pVars.
    int* pvars;
    // asdf2
    char asdf2[0x2A];
    // The type of moby it is.
    unsigned short oClass;
    // asdf3
    char asdf3[0x58];
};

#define o2mask (*((char*)0x0096c146))

#define orxon_clank_openable_doors_update_func ((void (*)(struct Moby*))0x187b68)
#define orxon_bar_gates_update_func ((void (*)(struct Moby*))0x27a488)
#define orxon_clank_section_gate ((void (*)(struct Moby*))0x2732f8)

void _start(struct Moby *self) {
	if (o2mask != 0 && self->state != 0 && self->pvars[19] != 1) {
		if (self->oClass == 0x590) {
			(self->pos).z = 200;
		} else {
			self->state = 3;
		}
		
		self->pvars[19] = 1;
	}
	
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