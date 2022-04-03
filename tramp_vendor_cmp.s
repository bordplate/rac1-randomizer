_start:
	mr r28, r3
	mr r3, r6
	bla 0x4f8d38
	cmpwi r3, 0
	mr r6, r3
	mr r3, r28
	ba 0x0016c7c4