entry:                             
	addis      r3,r3,0xb0
	lbz        r3,0x50(r3)
	cmpwi      r3,0x0
	blr
