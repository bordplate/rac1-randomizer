int _start(int item) {
	int class = 0;
	
	switch(item) {
		case 0x02:   // Heli-pack
			class = 0x47a;
			break;
		case 0x03:  // Thruster-pack
			class = 0x260;
			break;
		case 0x04:  // Hydro-pack
			class = 0x261;
			break;
		case 0x05: // Sonic summoner
			class = 0x1b1;
			break;
		case 0x06: // O2 Mask
			class = 0x509;
			break;
		case 0x07: // Pilots helmet
			class = 0x50a;
			break;
		case 0x1c: // Mangeboots
			class = 0xad;
			break;
		case 0x1d: // Grindboots
			class = 0xc3;
			break;
		case 0x1e: // Hoverboard
			class = 0x10e;
			break;
		case 0x21: // MapOMatic
			class = 0x266;
			break;
		case 0x22: // Bolt Grabber
			class = 0x26a;
			break;
		case 0x23: // Persuader
			class = 0x197;
			break;
		case 0x18:  // Drone-device
			class = 0x1df;
			break;
	}
	
	if (item > 0x23) {
		class = 0x10e;
	}
	
	return class;
}