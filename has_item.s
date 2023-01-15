; We store what items the player has gotten at 0xB00050
; This has_item function checks that memory to see if the
;	player has the item.


; bool has_item(int item)
entry:
	addis      r3,r3,0xb0
	lbz        r3,0x50(r3)
	cmpwi      r3,0x0
	blr


; bool has_item(int item) {
; 	if (&(0xB00050 + item) == 1) {
;		return true;
;	}
;	
;	return false;
; }