items = {
    {id=0x02, name="Heli-pack",       req_items={} },
    {id=0x03, name="Thruster-pack",   req_items={} },
    {id=0x04, name="Hydro-pack",      req_items={{0x16}, {0x02}, {0x03}, {0x20}} },
    {id=0x05, name="Sonic Summoner",  req_items={{0x30}} },
    {id=0x06, name="O2 Mask",         req_items={{0x07}} },
    {id=0x07, name="Pilot's Helmet",  req_items={} },
    {id=0x09, name="Suck Cannon",     req_items={{0x02}, {0x03}, {0x20}} },
    {id=0x0B, name="Devastator",      req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x0C, name="Swingshot",       req_items={} },
    {id=0x0D, name="Visibomb",        req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x0E, name="Taunter",         req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x0F, name="Blaster",         req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x10, name="Pyrocitor",       req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x11, name="Mine Glove",      req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x12, name="Walloper",        req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x13, name="Tesla Claw",      req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x14, name="Glove of Doom",   req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x15, name="Morph-O-Ray",     req_items={{0x0C}, {0x20}} },
    {id=0x16, name="Hydrodisplacer",  req_items={{0x1A}, {0x02}, {0x03}, {0x20}} },
    {id=0x17, name="R.Y.N.O.",        req_items={{0x1B,0x02}, {0x1B,0x03}, {0x1B,0x20}} },
    {id=0x18, name="Drone Device",    req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x19, name="Decoy Glove",     req_items={}, ill_items={0x30,0x31,0x32,0x34,0x35} },
    {id=0x1A, name="Trespasser",      req_items={{0x0C}, {0x02}, {0x03}, {0x20}} },
    {id=0x1B, name="MetalDetector",   req_items={{0x1C}, {0x02}, {0x03}, {0x20}} },
    {id=0x1C, name="Magneboots",      req_items={} },
    {id=0x1D, name="Grindboots",      req_items={{0x0C}, {0x02}, {0x03}, {0x20}} },
    {id=0x1E, name="Hoverboard",      req_items={} },
    {id=0x1F, name="Hologuise",       req_items={{0x1E,0x02}, {0x1E,0x0D}, {0x1E,0x19}, {0x03}, {0x20}} },
    {id=0x20, name="PDA",             req_items={{0x1C}} },
    {id=0x21, name="Map-O-Matic",     req_items={{0x1D}, {0x20}} },
    {id=0x22, name="Bolt Grabber",    req_items={{0x04,0x06}, {0x20}, {0x02}, {0x03}} },
    {id=0x23, name="Persuader",       req_items={{0x31,0x1A,0x16}} },
    {id=0x30, name="Zoomerator",      req_items={{0x02}, {0x03}, {0x20}} },
    {id=0x31, name="Raritanium",      req_items={{0x0C}, {0x02}, {0x03}, {0x20}} },
    {id=0x32, name="Codebot",         req_items={} },
    {id=0x34, name="Premium Nanotech",req_items={{0x06,0x02}, {0x06,0x03}, {0x06,0x20}} },
    {id=0x35, name="Ultra Nanotech",  req_items={{0x34,0x06,0x02}, {0x34,0x06,0x03}, {0x34,0x06,0x20}} },
}

infobots = {
    {id=0x01, req_items={} },				                        -- Veldin1 -> Novalis
    {id=0x02, req_items={} },				                        -- Novalis -> Aridia
    {id=0x03, req_items={} },				                        -- Novalis -> Kerwan
    {id=0x04, req_items={{0x02}, {0x03}, {0x20}} },         -- Kerwan -> Eudora
    {id=0x05, req_items={} },				                        -- Blarg -> Rilgar
    {id=0x06, req_items={{0x02}, {0x03}, {0x20}, {0x19}} }, -- Eudora -> Blarg
    {id=0x07, req_items={{0x02}, {0x03}, {0x20}, {0x0C}} }, -- Rilgar -> Umbris
    {id=0x08, req_items={{0x0C}, {0x02}, {0x03}, {0x20}} }, -- Umbris -> Batalia
    {id=0x09, req_items={{0x1D}, {0x02}, {0x20}} },         -- Batalia -> Gaspar
    {id=0x0A, req_items={} },				                        -- Batalia -> Orxon
    {id=0x0B, req_items={} },				                        -- Orxon -> Pokitaru
    {id=0x0C, req_items={{0x06,0x02}, {0x06,0x03}, {0x06,0x20}} },         -- Orxon -> Hoven
    {id=0x0D, req_items={} },				                                       -- Hoven -> Gemlik
    {id=0x0E, req_items={{0x0C,0x1C,0x1A,0x0B}, {0x02}, {0x03}, {0x20}} }, -- Gemlik -> Oltanis
    {id=0x0F, req_items={{0x1D}, {0x1C}, {0x20}} },         -- Oltanis -> Quartu
    {id=0x10, req_items={{0x0C}, {0x02}, {0x03}, {0x20}} }, -- Quartu -> KaleboIII
    {id=0x11, req_items={{0x02}, {0x03}, {0x20}} },         -- Quartu -> Fleet
    {id=0x12, req_items={{0x03}, {0x1C}, {0x19}, {0x20}} }  -- Fleet -> Veldin2
}

planets = {
    {id=1,  name="Novalis",  infobots={0x02,0x03},  items={0x10} },
    {id=2,  name="Aridia",   infobots={},           items={0x1E,0x1A,0x05} },
    {id=3,  name="Kerwan",   infobots={0x04},       items={0x0C,0x02,0x0F} },
    {id=4,  name="Eudora",   infobots={0x06},       items={0x14,0x09} },
    {id=5,  name="Rilgar",   infobots={0x07},       items={0x30,0x11,0x17} },
    {id=6,  name="Blarg",    infobots={0x05},       items={0x1D,0x16,0x0E} },
    {id=7,  name="Umbris",   infobots={0x08},       items={} },
    {id=8,  name="Batalia",  infobots={0x09,0x0A},  items={0x1B,0x0B} },
    {id=9,  name="Gaspar",   infobots={},           items={0x07,0x12} },
    {id=10, name="Orxon",    infobots={0x0B,0x0C},  items={0x34,0x35,0x1C,0x0D} },
    {id=11, name="Pokitaru", infobots={},           items={0x03,0x06,0x23,0x19} },
    {id=12, name="Hoven",    infobots={0x0D},       items={0x31,0x04,0x18} },
    {id=13, name="Gemlik",   infobots={0x0E},       items={} },
    {id=14, name="Oltanis",  infobots={0x0F},       items={0x20,0x13,0x15} },
    {id=15, name="Quartu",   infobots={0x10,0x11},  items={0x22} },
    {id=16, name="KaleboIII",infobots={},           items={0x1F,0x21} },
    {id=17, name="Fleet",    infobots={0x12},       items={0x32} }
}
