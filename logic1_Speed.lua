require 'table_id'

items = {
    {id=0x02, 	location="Al's Shop",			host_item="Heli-pack",			req_items={} },													 									--Kerwan
    {id=0x03,	location="Bob's Shop",			host_item="Thruster-pack",		req_items={} },											 											--Poki
    {id=0x04,	location="Edwina's Shop",		host_item="Hydro-pack",			req_items={{keyid.hydrodisplacer}, {keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },		--Hoven
    {id=0x05,	location="Skidd's Agent",		host_item="Sonic Summoner",		req_items={{keyid.zoomerator}} },																	--Aridia
    {id=0x06,	location="Ship Fight",			host_item="O2 Mask",			req_items={{keyid.pilots_helmet, keyid.thruster_pack}, {keyid.pilots_helmet, keyid.decoy_glove}} },	--Poki
    {id=0x07,	location="Pilot's Helmet",		host_item="Pilot's Helmet",		req_items={} },																						--Gaspar
    {id=0x09,	location="Suck Cannon",			host_item="Suck Cannon",		req_items={{keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },								--Eudora
    {id=0x0B,	location="Vendor",				host_item="Devastator",			req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },		--Batalia
    {id=0x0C,	location="Fitness Course",		host_item="Swingshot",			req_items={} },																						--Kerwan
    {id=0x0D,	location="Vendor",				host_item="Visibomb",			req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },		--Orxon
    {id=0x0E,	location="Vendor",				host_item="Taunter",			req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },		--Blarg
    {id=0x0F,	location="Vendor",				host_item="Blaster",			req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },		--Kerwan
    {id=0x10,	location="Vendor",				host_item="Pyrocitor",			req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },		--Novalis
    {id=0x11,	location="Vendor",				host_item="Mine Glove",			req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },		--Rilgar
    {id=0x12,	location="Vendor",				host_item="Walloper",			req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },		--Gaspar
    {id=0x13,	location="Vendor",				host_item="Tesla Claw",			req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },		--Oltanis
    {id=0x14,	location="Vendor",				host_item="Glove of Doom",		req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },		--Eudora
    {id=0x15,	location="Morph-O-Ray",			host_item="Morph-O-Ray",		req_items={{keyid.swingshot}, {keyid.pda}} },														--Oltanis
    {id=0x16,	location="Outside",				host_item="Hydrodisplacer",		req_items={{keyid.trespasser}, {keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },																			--Blarg
    {id=0x17,	location="Shady Salesman",		host_item="R.Y.N.O.",			req_items={{keyid.metal_detector, keyid.heli_pack}, {keyid.metal_detector, keyid.thruster_pack}, {keyid.metal_detector, keyid.pda}} },								--Rilgar
    {id=0x18,	location="Vendor",				host_item="Drone Device",		req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },																		--Hoven
    {id=0x19,	location="Vendor",				host_item="Decoy Glove",		req_items={},											ill_items={0x30,0x31,0x32,0x34,0x35} },																		--Poki
    {id=0x1A,	location="Construction Zone",	host_item="Trespasser",			req_items={{keyid.swingshot}, {keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },																				--Aridia
    {id=0x1B,	location="Turret Fight", 		host_item="MetalDetector",		req_items={{keyid.magneboots}, {keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },																			--Batalia
    {id=0x1C,	location="Clank 1st Item",		host_item="Magneboots",			req_items={} },																																						--Orxon
    {id=0x1D,	location="Alien Queen",			host_item="Grindboots",			req_items={{keyid.swingshot}, {keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },																				--Blarg
    {id=0x1E,	location="Save Skidd",			host_item="Hoverboard",			req_items={} },																																						--Aridia
    {id=0x1F,	location="Hoverboard Race",		host_item="Hologuise",			req_items={{keyid.hoverboard, keyid.heli_pack}, {keyid.hoverboard, keyid.visibomb}, {keyid.hoverboard, keyid.decoy_glove}, {keyid.thruster_pack}, {keyid.pda}} },	--KaleboIII
    {id=0x20,	location="Steve",				host_item="PDA",				req_items={{keyid.magneboots}} },																																	--Oltanis
    {id=0x21,	location="Grind Rail",			host_item="Map-O-Matic",		req_items={{keyid.grindboots}, {keyid.pda}} },																														--KaleboIII
    {id=0x22,	location="Water path",			host_item="Bolt Grabber",		req_items={{keyid.hydro_pack, keyid.o2_mask}, {keyid.pda}, {keyid.heli_pack}, {keyid.thruster_pack}} },																--Quartu
    {id=0x23,	location="Water Lab",			host_item="Persuader",			req_items={{keyid.raritanium, keyid.trespasser, keyid.hydrodisplacer}, {keyid.raritanium,keyid.o2_mask}, {keyid.raritanium, keyid.decoy_glove, keyid.pda}} },		--Poki
    {id=0x30,	location="Hoverboard Race",		host_item="Zoomerator",			req_items={{keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },																								--Rilgar
    {id=0x31,	location="Drill Guy",			host_item="Raritanium",			req_items={{keyid.swingshot}, {keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },																				--Hoven
    {id=0x32,	location="Water path",			host_item="Codebot",			req_items={} },																																						--Fleet
    {id=0x34,	location="Nanotech Vendor 1",	host_item="Premium Nanotech",	req_items={{keyid.o2_mask, keyid.heli_pack}, {keyid.o2_mask, keyid.thruster_pack}, {keyid.o2_mask, keyid.pda}} },													--Orxon
    {id=0x35,	location="Nanotech Vendor 2",	host_item="Ultra Nanotech",		req_items={{keyid.premium_nanotech, keyid.o2_mask, keyid.heli_pack}, {keyid.premium_nanotech, keyid.o2_mask, keyid.thruster_pack}, {keyid.premium_nanotech, keyid.o2_mask, keyid.pda}} },	--Orxon
}

infobots = {
    {id=0x01, req_items={} },																									-- Novalis "infobot" on Veldin1 Clank
    {id=0x02, req_items={} },																									-- Aridia infobot on Novalis, Water works
    {id=0x03, req_items={} },																									-- Kerwan infobot on Novalis, Save the Chairman 
    {id=0x04, req_items={{keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },												-- Eudora infobot on Kerwan, Train
    {id=0x05, req_items={} },																									-- Rilgar infobot on Blarg, Warship
    {id=0x06, req_items={{keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}, {keyid.decoy_glove}} },							-- Blarg infobot on Eudora, Robot Lieutenant
    {id=0x07, req_items={{keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}, {keyid.swingshot}} },							-- Umbris infobot on Rilgar, Qwark's Trailer
    {id=0x08, req_items={{keyid.swingshot}, {keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },							-- Batalia infobot on Umbris, Snagglebeast
    {id=0x09, req_items={{keyid.grindboots}, {keyid.heli_pack}, {keyid.pda}} },													-- Gaspar infobot on Batalia, Grind Rail
    {id=0x0A, req_items={} },																									-- Orxon infobot on Batalia, Commando
    {id=0x0B, req_items={} },																									-- Pokitaru infobot on Orxon, Clank 2
    {id=0x0C, req_items={{keyid.o2_mask,keyid.heli_pack}, {keyid.o2_mask,keyid.thruster_pack}, {keyid.o2_mask,keyid.pda}} },	-- Hoven infobot on Orxon, Chase the infobot
    {id=0x0D, req_items={} },																									-- Gemlik infobot on Hoven, Turret Fight
    {id=0x0E, req_items={{keyid.swingshot,keyid.magneboots,keyid.trespasser,keyid.devastator}, {keyid.swingshot,keyid.magneboots,keyid.trespasser,keyid.visibomb}, {keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },	-- Oltanis infobot on Gemlik, Defeat Qwark
    {id=0x0F, req_items={{keyid.grindboots}, {keyid.magneboots}, {keyid.pda}} },												-- Quartu infobot on Oltanis, Deaf guy
    {id=0x10, req_items={{keyid.swingshot}, {keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },							-- KaleboIII infobot on Quartu, Giant Clank Fight
    {id=0x11, req_items={{keyid.heli_pack}, {keyid.thruster_pack}, {keyid.pda}} },												-- Fleet infobot on Quartu, Clank's Mum
    {id=0x12, req_items={{keyid.thruster_pack}, {keyid.magneboots}, {keyid.decoy_glove}, {keyid.pda}} }							-- Veldin2 infobot on Drek's Fleet, Battle through the ships
}

planets = {
	{id=0x01,	location="Clank",				host_item="Novalis",	infobots={keyid.aridia,keyid.kerwan},	items={keyid.pyrociter}},																--Veldin1
	{id=0x02,	location="Water works",			host_item="Aridia",		infobots={},							items={keyid.hoverboard,keyid.trespasser,keyid.sonic_summoner}},						--Novalis
	{id=0x03,	location="Save the Chairman",	host_item="Kerwan",		infobots={keyid.eudora},				items={keyid.swingshot,keyid.heli_pack,keyid.blaster}},									--Novalis
	{id=0x04,	location="Train",				host_item="Eudora",		infobots={keyid.blarg},					items={keyid.glove_of_doom,keyid.suck_cannon}},											--Kerwan
	{id=0x05,	location="Warship",				host_item="Rilgar",		infobots={keyid.umbris},				items={keyid.zoomerator,keyid.mine_glove,keyid.ryno}},									--Blarg
	{id=0x06,	location="Robot Lieutenant",	host_item="Blarg",		infobots={keyid.rilgar},				items={keyid.grindboots,keyid.hydrodisplacer,keyid.taunter}},							--Eudora
	{id=0x07,	location="Qwark's Trailer",		host_item="Umbris",		infobots={keyid.batalia},				items={}},																				--Rilgar
	{id=0x08,	location="Snagglebeast",		host_item="Batalia",	infobots={keyid.gaspar,keyid.orxon},	items={keyid.metal_detector,keyid.devastator}},											--Umbris
	{id=0x09,	location="Grind Rail",			host_item="Gaspar",		infobots={},							items={keyid.pilots_helmet,keyid.walloper}},											--Batalia
	{id=0x0A,	location="Commando",			host_item="Orxon",		infobots={keyid.pokitaru,keyid.hoven},	items={keyid.premium_nanotech,keyid.ultra_nanotech,keyid.magneboots,keyid.visibomb}},	--Batalia
	{id=0x0B,	location="Clank 2nd Item",		host_item="Pokitaru",	infobots={},							items={keyid.thruster_pack,keyid.o2_mask,keyid.persuader,keyid.decoy_glove}},			--Orxon
	{id=0x0C,	location="Chase the Infobot",	host_item="Hoven",		infobots={keyid.gemlik},				items={keyid.raritanium,keyid.hydro_pack,keyid.drone_device}},							--Orxon
	{id=0x0D,	location="Turret Fight",		host_item="Gemlik",		infobots={keyid.oltanis},				items={}},																				--Hoven
	{id=0x0E,	location="Defeat Qwark",		host_item="Oltanis",	infobots={keyid.quartu},				items={keyid.pda,keyid.tesla_claw,keyid.morph_o_ray}},									--Gemlik
	{id=0x0F,	location="Deaf Guy",			host_item="Quartu",		infobots={keyid.kalebo,keyid.fleet},	items={keyid.bolt_grabber}},															--Oltanis
	{id=0x10,	location="Giant Clank Fight",	host_item="KaleboIII",	infobots={},							items={keyid.hologuise,keyid.map_o_matic}},												--Quartu
	{id=0x11,	location="Clank's Mum",			host_item="Fleet",		infobots={keyid.veldin},				items={keyid.codebot}}																	--Quartu
}

