; If you have the thruster pack, but not the heli-pack, you can't glide
;	or use some of the other functionality of the thruster-pack. 
; This function returns true if the player has either the heli-pack or the thruster-pack.

; bool has_thruster_heli_pack()
entry:
	lis 	r3, 0x97
	subic 	r3, r3, 0x3ec0
	lbz 	r3, 0x2(r3)
	cmpwi 	r3, 0x1
	beq has_packs
	
	lis 	r3, 0x97
	subic 	r3, r3, 0x3ec0
	lbz 	r3, 0x3(r3)
	cmpwi 	r3, 0x1
	beq has_packs
	
	cmpwi r3, 0
	blr
	
has_packs:
	lis r3, 0
	cmpwi r3, 1
	blr
	

; Pseudo-code:
; bool has_thruster_heli_pack() {
; 	if (&(0x973ec02) == 1 || &(0x973ec03) == 1) {
; 		return true;
; 	}
;	
; 	return false;
; }


; I can't remember why I had to implement this in Assembly and not just C,
;	but there was a good reason!