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