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
    void* pvars;
    // asdf2
    char asdf2[0x2A];
    // The type of moby it is.
    unsigned short oClass;
    // asdf3
    char asdf3[0x58];
};
	
#define items_map ((char*)0xB00050)
#define item_replacements ((char*)0xB00100)

#define special_items ((char*)0x96bff0)	

#define toast_message ((void (*)(unsigned int, int))0x112a38)

#define coords_map ((char*)0xB00000)

#define orig_update_func ((void (*)(struct Moby*))0x0183880)

void _start(struct Moby *self) {	
	if (self->state == 0) {
		if (self->oClass == 0x3ed) {  // Trespasser
			if (items_map[0x1a] == 1) {
				delete_moby(self);
				return;
			}
		} else {  // Hydrodisplacer
			if (items_map[0x16] == 1) {
				delete_moby(self);
				return;
			}
		}
	}
	
	orig_update_func(self);
}