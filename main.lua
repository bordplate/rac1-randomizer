require 'deepcopy'
require 'io'
require 'crc32'

items = {
    {id=2, location="Al's Shop", host_item="Heli-pack", req_items={} },													--Kerwan
    {id=3, location="Bob's Shop", host_item="Thruster-pack",  req_items={} },											--Poki
    {id=4, location="Edwina's Shop", host_item="Hydro-pack", req_items={{0x16}} },										--Hoven
    {id=5, location="Skidd's Agent", host_item="Sonic Summoner", req_items={{0x30}} },									--Aridia
    {id=6, location="Ship Fight", host_item="O2 Mask", req_items={{7}} },												--Poki
    {id=7, location="Pilot's Helmet", host_item="Pilot's Helmet", req_items={} },										--Gaspar
	{id=0x9, location="Suck Cannon", host_item="Suck Cannon", req_items={{0x2}, {0x3}} },								--Eudora
	{id=0xb, location="Vendor", host_item="Devastator", req_items={}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },		--Batalia
	{id=0xc, location="Fitness Course", host_item="Swingshot", req_items={} },											--Kerwan
	{id=0xd, location="Vendor", host_item="Visibomb", req_items={{6}}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },		--Orxon
	{id=0xe, location="Vendor", host_item="Taunter", req_items={}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },			--Blarg
	{id=0xf, location="Vendor", host_item="Blaster", req_items={}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },			--Kerwan
	{id=0x10, location="Vendor", host_item="Pyrocitor", req_items={}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },		--Novalis	
	{id=0x11, location="Vendor", host_item="Mine Glove", req_items={}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },		--Rilgar
	{id=0x12, location="Vendor", host_item="Walloper", req_items={}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },		--Gaspar
	{id=0x13, location="Vendor", host_item="Tesla Claw", req_items={}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },		--Oltanis
	{id=0x14, location="Vendor", host_item="Glove of Doom", req_items={}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },	--Eudora
	{id=0x15, location="Morph-O-Ray", host_item="Morph-O-Ray", req_items={{0xc}} },										--Oltanis
	{id=0x16, location="Outside", host_item="Hydrodisplacer", req_items={{0x1a}} },										--Blarg
	{id=0x17, location="Shady Salesman", host_item="R.Y.N.O.", req_items={{0x1b, 0x2}, {0x1b, 0x3}} },					--Rilgar
	{id=0x18, location="Vendor", host_item="Drone Device", req_items={}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },	--Hoven
	{id=0x19, location="Vendor", host_item="Decoy Glove", req_items={}, ill_items={0x30, 0x31, 0x32, 0x34, 0x35} },		--Poki
	{id=0x1a, location="Construction Zone", host_item="Trespasser", req_items={{0xc}} },								--Aridia
    {id=0x1b, location="Turret Fight", host_item="Metaldetector", req_items={{0x1c}} },									--Batalia
    {id=0x1c, location="Clank 1st Item", host_item="Magneboots", req_items={} },										--Orxon
    {id=0x1d, location="Alien Queen", host_item="Grindboots", req_items={{0xc}} },										--Blarg
    {id=0x1e, location="Save Skidd", host_item="Hoverboard", req_items={} },											--Aridia
    {id=0x1f, location="Hoverboard Race", host_item="Hologuise", req_items={{0x1e,2,0xc,0x1d},{0x1e,3,0xc,0x1d}} },		--KaleboIII
    {id=0x20, location="Steve", host_item="PDA", req_items={{0x1c}} },													--Oltanis
    {id=0x21, location="Grind Rail", host_item="Map-O-Matic", req_items={{0x1d}} },										--KaleboIII
    {id=0x22, location="Water path", host_item="Bolt Grabber", req_items={{4, 6}} },									--Quartu
    {id=0x23, location="Water Lab", host_item="Persuader", req_items={{0x1a, 0x31, 0x16}} },							--Poki
    {id=0x30, location="Hoverboard Race", host_item="Zoomerator", req_items={{0x1e,2},{0x1e,3}} },						--Rilgar
    {id=0x31, location="Drill Guy", host_item="Raritanium", req_items={{0xc,2}, {0xc,3}} },								--Hoven
    {id=0x32, location="Water path", host_item="Codebot", req_items={{4,6}} },											--Fleet
    {id=0x34, location="Nanotech Vendor 1", host_item="Premium Nanotech", req_items={{6, 2}, {6, 3}} },							--Orxon
    {id=0x35, location="Nanotech Vendor 2", host_item="Ultra Nanotech", req_items={{6, 3, 0x34, 0x1b}, {6, 2, 0x34, 0x1b} }},	--Orxon
}

infobots = {
    {id=1, req_items={} },								-- Novalis "infobot" on Veldin1 Clank
    {id=2, req_items={} },								-- Aridia infobot on Novalis, Water works
    {id=3, req_items={} },								-- Kerwan infobot on Novalis, Save the Chairman 
    {id=4, req_items={{2}, {3}} },						-- Eudora infobot on Kerwan, Train
    {id=5, req_items={} },								-- Rilgar infobot on Blarg, Warship
    {id=6, req_items={{0x1a,0xc,2}, {0x1a, 0xc, 3}}},	-- Blarg infobot on Eudora, Robot Lieutenant
    {id=7, req_items={{0xc,0x16,2},{0xc,0x16,3}}},		-- Umbris infobot on Rilgar, Qwark's Trailer
    {id=8, req_items={{0xc,0x16}}},						-- Batalia infobot on Umbris, Snagglebeast
    {id=9, req_items={{0x1d}} },						-- Gaspar infobot on Batalia, Grind Rail
    {id=10, req_items={} },								-- Orxon infobot on Batalia, Commando
    {id=0xb, req_items={} },							-- Pokitaru infobot on Orxon, Clank 2
    {id=0xc, req_items={{6,0xc,0x1c, 3}} },				-- Hoven infobot on Orxon, Chase the infobot
    {id=0xd, req_items={{0x9},{0xb},{0xd},{0xf},{0x10},{0x13},{0x17}} },	-- Gemlik infobot on Hoven, Turret Fight
    {id=0xe, req_items={{0xc, 0x1c, 0x1a}} },			-- Oltanis infobot on Gemlik, Defeat Qwark
    {id=0xf, req_items={{0x1d}} }, 						-- Quartu infobot on Oltanis, Deaf guy
    {id=0x10, req_items={{0xc}} },    					-- KaleboIII infobot on Quartu, Giant Clank Fight
    {id=0x11, req_items={{3, 0xc, 0x1f}} },				-- Fleet infobot on Quartu, Clank's Mum
    {id=0x12, req_items={{0x1c,0x1f}} }					-- Veldin2 infobot on Drek's Fleet, Battle through the ships
}

planets = {
	{id=1, location="Clank", host_item="Novalis", infobots={2,3}, items={0x10}},								--Veldin1
	{id=2, location="Water works", host_item="Aridia", infobots={},items={0x1e, 0x1a, 5}},						--Novalis
	{id=3, location="Save the Chairman", host_item="Kerwan", infobots={4}, items={0xc, 2, 0xf}},				--Novalis
	{id=4, location="Train", host_item="Eudora", infobots={6}, items={0x14, 0x9}},								--Kerwan
	{id=5, location="Warship", host_item="Rilgar", infobots={7}, items={0x30, 0x11, 0x17}},						--Blarg
	{id=6, location="Robot Lieutenant", host_item="Blarg", infobots={5}, items={0x1d, 0x16, 0xe}},				--Eudora
	{id=7, location="Qwark's Trailer", host_item="Umbris", infobots={8}, items={}},								--Rilgar
	{id=8, location="Snagglebeast", host_item="Batalia", infobots={9, 10}, items={0x1b, 0xb}},					--Umbris
	{id=9, location="Grind Rail", host_item="Gaspar", infobots={}, items={7, 0x12}},							--Batalia
	{id=10,location="Commando", host_item="Orxon",  infobots={0xb, 0xc}, items={0x34, 0x35, 0x1c, 0xd}},		--Batalia
	{id=11,location="Clank 2nd Item", host_item="Pokitaru",  infobots={}, items={3, 6, 0x23, 0x19}},			--Orxon
	{id=12,location="Chase the Infobot", host_item="Hoven",  infobots={0xd}, items={0x31, 4, 0x18}},			--Orxon
	{id=13,location="Turret Fight", host_item="Gemlik",  infobots={0xe}, items={}},								--Hoven
	{id=14,location="Defeat Qwark", host_item="Oltanis",  infobots={0xf}, items={0x20, 0x13, 0x15}},			--Gemlik
	{id=15,location="Deaf Guy", host_item="Quartu",  infobots={0x10, 0x11}, items={0x22}},						--Oltanis
	{id=16,location="Giant Clank Fight", host_item="KaleboIII",  infobots={}, items={0x1f, 0x21}},				--Quartu
	{id=17,location="Clank's Mum", host_item="Fleet",  infobots={0x12}, items={0x32}}							--Quartu
}

function GetItem(host_item) 
	for i, item in ipairs(items) do
		if host_item == item[host_item] then
			return host_item
		end
	end
end

function PlanetSpecificFix(planet, replaced_planet)
	---------
	-- Infobot vendors
	---------

	-- Aridia infobot, assign right coords to plumber at Novalis update func
	if planet == 2 then
		Ratchetron:WriteMemory(GAME_PID, 0x4558b8 + 3, 1, inttobytes(replaced_planet, 1))
	end
	
	-- Umbris infobot, assign right coords to Rilgar Bouncer update func
	if planet == 7 then
		Ratchetron:WriteMemory(GAME_PID, 0x4b1ba8 + 3, 1, inttobytes(replaced_planet, 1))
	end
	
	-- Gaspar infobot, assign right coords to Deserter at Batalia update func
	if planet == 9 then
		Ratchetron:WriteMemory(GAME_PID, 0x1df984 + 3, 1, inttobytes(replaced_planet, 1))
	end
	
	-- Orxon infobot, assign right coords to Commando at Batalia update func
	if planet == 10 then
		Ratchetron:WriteMemory(GAME_PID, 0x1d82a0 + 3, 1, inttobytes(replaced_planet, 1))
	end
	
	-- Quartu infobot, assign right coords to Oltanis Scrap Merchant update func
	if planet == 15 then
		Ratchetron:WriteMemory(GAME_PID, 0x4b7e04 + 3, 1, inttobytes(replaced_planet, 1))
	end
	
	-- Kalebo III infobot, assign right coords to Quartu Scientist update func
	if planet == 16 then
		Ratchetron:WriteMemory(GAME_PID, 0x267d80 + 3, 1, inttobytes(replaced_planet, 1))
	end
	
	---------
	-- Other
	---------
	
	-- Hoven infobot, something specific in the infobot update func
	if planet == 0xc then
		Ratchetron:WriteMemory(GAME_PID, 0x44b884 + 3, 1, inttobytes(replaced_planet, 1))
	end
	
	-- Redirect Veldin 1 to not Novalis
	if planet == 1 then
		Ratchetron:WriteMemory(GAME_PID, 0x4814dc + 3, 1, inttobytes(replaced_planet, 1))
	end
end

function ReplaceItem(item, replaced_item)
	-- Vendor items (ignoring Swingshot, Succ, Morpho and RYNO)
	if (item >= 0xb and item <= 0x19 and item ~= 0xc and item ~= 0x16 and item ~= 0x15 and item ~= 0x17) then
		for index, planet in ipairs(planets) do
			if InArray(planet.items, item) then
				if replaced_item >= 0x30 then
					print("YO WTF I'M WRITING ILLEGAL ITEM " .. replaced_item .. " TO VENDOR ITEM " .. item)
				end
			
				Ratchetron:WriteMemory(GAME_PID, 0x737bf0 + (planet.id * 4), 4, inttobytes(replaced_item, 4))
				Ratchetron:WriteMemory(GAME_PID, 0xB00150 + replaced_item, 1, inttobytes(1, 1))
			end
		end
	end

	Ratchetron:WriteMemory(GAME_PID, 0xB00100 + item, 1, inttobytes(replaced_item, 1))
end

function PlanetForItem(item_id)
	for i, planet in pairs(planets) do
		for j, item in ipairs(planet.items) do
			if item == item_id then
				return planet.id
			end
		end
	end
	
	return -1
end

--- Deep copy of tables

-- Shuffle table
function shuffle(tbl)
  for i = #tbl, 2, -1 do
    local j = math.random(i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
end

function GetItemWithID(id) 
	for i, item in ipairs(items) do
		if item.id == id then
			return item
		end
	end
	
	print("Couldn't find item: " .. id)
	
	return -1
end

function RemoveItem(tbl, id)
	for i, item in ipairs(tbl) do
		if item.id == id then
			table.remove(tbl, i)
			return
		end
	end
	
	print("Couldn't find item: " .. id)
	
	return -1
end

function InArray (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

file = nil

write_debug_graph = true

function filewrite(text)
	if write_debug_graph == false then
		return
	end

	file:write(text)
	file:flush()
end
	

function Randomize(seed)
	math.randomseed(seed)

	-- GraphViz file for debugging purposes. Use something like https://dreampuf.github.io/GraphvizOnline/ to view the graph.
	file = io.open('randomizer_graph.dot', 'w')
	filewrite("digraph {\n")
	
	-- Pool of planets we haven't used, planets with outs we haven't used, and free item slots where we can place item requirements we might need to fill
	local available_planets = table.deepcopy(planets)
	local available_outs = {{planet=0, infobot=table.deepcopy(infobots[1])}}  -- Add Veldin1 with Novalis infobot as first available out
	local available_item_slots = {}
	
	-- List to keep track of items we haven't placed yet so we can fill them out at the end.
	-- When making the planet graph we only place items that are required to traverse that path, other items are just placed in remaining available item slots at the end of the program.
	local remaining_items = table.deepcopy(items)
	
	-- Planets and items placed and locked
	local planet_list = {}
	local item_list = {}
	
	local finished = false
	
	while not finished do
		file:flush()
		-- Find next planet to add to graph
		local found_planet = nil
		local planet_index = 0
		
		::continue_planet_search::
		while found_planet == nil do
			planet_index = math.ceil(math.random() * #available_planets)
		
			local working_planet = available_planets[planet_index]
			
			-- If we only have 1 available out, we need to select a planet with at least 1 infobot, otherwise we're stuck in a dead end.
			if #available_outs <= 1 and #working_planet["infobots"] <= 0 and #available_planets > 1 then 
				goto continue_planet_search
			end
	
			found_planet = working_planet
		end
		
		--print("Found planet: " .. found_planet.id)
		
		local n_min_item_slots_needed = 0
		local n_max_item_slots_needed = 0
		
		
		::find_available_out::
		-- Find next out we meet the requirements for
		local out_index = #available_outs
		for i=#available_outs, 1, -1 do
			if #available_outs[i].infobot.req_items <= 0 then
				out_index = i
				--print("No items required")
				goto found_available_out  -- No item requirements, just continue
			end
			
			-- Since there are different combinations of items that can be used to get an infobot, look through all of them
			filewrite("# Finding requirements for infobot: " .. available_outs[i].infobot.id .. "\n")
			for j, req_combination in ipairs(available_outs[i].infobot.req_items) do
				if #req_combination > n_max_item_slots_needed then
					n_max_item_slots_needed = #req_combination
				end
				
				if #req_combination < n_min_item_slots_needed or n_min_item_slots_needed == 0 then
					n_min_item_slots_needed = #req_combination
				end
			
				for m, required in pairs(req_combination) do				
					local found_items = 0
				
					-- Find out if the current item requirement is in the list of items we've already placed
					for l, available_item in pairs(item_list) do
						if required == available_item then
							found_items = found_items + 1
						end
					end
					
					if found_items >= #req_combination then
						out_index = i
						filewrite("# Requirements filled for " .. available_outs[i].infobot.id .. "\n")
						goto found_available_out  -- We met the requirements for at least 1 combination of items
					end
				end
			end
		end
		
		if n_min_item_slots_needed > 0 and #available_item_slots <= 0 then
			--print("Can't continue. No available item slots to place items.")
			found_planet = nil
			
			return -1
		end
		
		--  Didn't find an available out; count available item slots that we can fill
		for i, item_slot in pairs(available_item_slots) do
			local requirement_combinations = table.deepcopy(item_slot.item.req_items)
			
			local n_min_item_slots = 0
			local n_max_item_slots = 0
			
			for j, requirements in pairs(requirement_combinations) do
				local n_requirements = 0
				
				local next_req = {}
				
				for jj, requirement in ipairs(requirements) do
					next_req[#next_req + 1] = requirement
				end
			
				local passes2 = 0
				while #next_req > 0 do
					passes2 = passes2 + 1
					
					if passes2 > 100 then
						--print("Shit's fucking fucked dude")
						return -1
					end
				
					local item = GetItemWithID(next_req[1])
					
					-- Find out if the current item requirement is in the list of items we've already placed
					local has_item = false
					for l, available_item in pairs(item_list) do
						if item.id == available_item then
							has_item = true
						end
					end
					
					if not has_item then
						n_requirements = n_requirements + 1
					
						if #item.req_items > 0 then
							for k, req in ipairs(item.req_items[math.ceil(math.random() * #item.req_items)]) do
								local has_requirement = false
								for l, available_item in pairs(item_list) do
									if item.id == available_item then
										has_requirement = true
									end
								end
								
								if not has_requirement then
									n_requirements = n_requirements + 1
								end
							end
						end
					end
					
					table.remove(next_req, 1)
				end
				
				if n_requirements < n_min_item_slots or n_min_item_slots == 0 then
					n_min_item_slots = n_requirements
				end
				
				if n_requirements > n_max_item_slots then
					n_max_item_slots = n_requirements
				end
			end
			
			n_max_item_slots_needed = n_max_item_slots_needed + n_max_item_slots
			n_min_item_slots_needed = n_min_item_slots_needed + n_min_item_slots
		end
		
		
		-- Try to fill available item slots to meet requirements for another out, starting with first available out
		--filewrite("# Filling available outs for " .. found_planet.host_item .. "\n")
		for i, out in pairs(available_outs) do
			--filewrite("# Available out: " .. out .. "\n")
			-- Try to fill the requirement in previous planets first
			local requirement_combinations = table.deepcopy(out.infobot.req_items)
			
			shuffle(requirement_combinations)
			for j, requirements in ipairs(requirement_combinations) do
				local n_requirements = 0  -- Requirements we have to fill
				
				local next_req = {}
				
				-- Recursively count requirements for combination
				for jj, requirement in ipairs(requirements) do
					next_req[#next_req + 1] = requirement
				end
				
				local passes1 = 0
				while #next_req > 0 do
					
					passes1 = passes1 + 1
					
					if passes1 > 100 then
						--print("Dude shit's fucked")
						return -1
					end
					
					local item = GetItemWithID(next_req[1])

					-- Find out if the current item requirement is in the list of items we've already placed
					local has_item = false
					for l, available_item in ipairs(item_list) do
						if item.id == available_item then
							has_item = true
						end
					end
					
					if not has_item then
						n_requirements = n_requirements + 1
						
						if #item.req_items > 0 then
							for k, req in ipairs(item.req_items[math.ceil(math.random() * #item.req_items)]) do
								local has_requirement = false
								for l, available_item in pairs(item_list) do
									if item.id == available_item then
										has_requirement = true
									end
								end
								
								if not has_requirement then
									n_requirements = n_requirements + 1
								end
							end
						end
					end
					
					table.remove(next_req, 1)
				end
				
				if n_requirements <= n_min_item_slots_needed then
					-- We can start filling out items with the most convoluted route
					local requirements_left = table.deepcopy(requirements)
					local passes = 0
					
					::continue_requirement_search::
					
					local num_requirements_left = #requirements_left
					while num_requirements_left > 0 do
						passes = passes + 1
						
						if passes > 60 then
							--print("Dude shit's fucked")
							return -1
						end
						
						for l, available_item in pairs(item_list) do
							if requirements_left[1] == available_item then
								table.remove(requirements_left, 1)
								
								--print("Met requirement " .. available_item .. ". Still need to meet:")
								for iii, r in ipairs(requirements_left) do
									--print("\t" .. r)
								end
								
								goto continue_requirement_search
							end
						end
						
						local item_slot_id = math.ceil(math.random() * #available_item_slots)
						local item_slot = available_item_slots[item_slot_id]
						
						-- Check if this item slot has any illegal item replacements
						if item_slot.item.ill_items ~= nil then
							for index, value in ipairs(item_slot.item.ill_items) do
								if value == requirements_left[1] then
									requirements_left[#requirements_left + 1] = requirements_left[1]
									table.remove(requirements_left, 1)
									filewrite("# Encountered illegal item to replace " .. item_slot.item.host_item .. "\n")
									goto continue_requirement_search
								end
							end
						end
						
						-- Try to prevent putting items on the planets they are required for, makes for more interesting generation. 
						-- It's still possible, this just does a reroll.
						if #available_item_slots > 1 and planets[available_outs[out_index].planet].id == item_slot.planet then
							filewrite("# Trying to pick a different item slot\n")
							item_slot_id = math.ceil(math.random() * #available_item_slots)
							item_slot = available_item_slots[item_slot_id]
						elseif planets[available_outs[out_index].planet].id == item_slot.planet then
							filewrite("# Putting item on same planet as its requirement because only " .. #available_item_slots .. " were available.\n")
						end
						
						if #available_item_slots <= 0 then
							--print("No more available slots, shit's fucked.")
							return  -1
						end
						
						local n_requirements_met = 0
						
						-- Check that this item isn't a requirement for the available slot unless we already meet other requirements
						can_meet = true
						
						for ii, reqs in pairs(item_slot.item.req_items) do
							n_requirements_met = 0
							for kk, requirement in pairs(reqs) do
								if requirement == requirements_left[1] then
									--print(item_slot.item.location .. " can not be replaced with " .. GetItemWithID(requirements_left[1]).host_item)
									can_meet = false
									n_requirements_met = 0
								end
								
								can_meet = false
								for jj, available_item in pairs(item_list) do
									if requirement == available_item then
										--print(item_slot.item.host_item .. " met a requirement for " .. GetItemWithID(requirements_left[1]).location .. ", even though it is a requirement in a different combination")
										can_meet = true
										--filewrite("# " .. GetItemWithID(requirements_left[1]).host_item .. " met requirement for " .. GetItemWithID(requirement).location .. "\n")
										--n_requirements_met = n_requirements_met + 1
									end
								end
								
								if can_meet or has_item then
									filewrite("# " .. GetItemWithID(requirements_left[1]).host_item .. " met requirement for " .. GetItemWithID(requirement).location .. "\n")
								
									n_requirements_met = n_requirements_met + 1
								end
							end
							
							if n_requirements_met >= #requirements then
								filewrite("# " .. GetItemWithID(requirements_left[1]).host_item .. " n_requirements_met: " .. n_requirements_met .. ", #requirements: " .. #requirements .. "\n")
								can_meet = true
								goto continue_item_assignment
							end
						end
						
						if #item_slot.item.req_items > 0 then
						  can_meet = false
						end
									
						::continue_item_assignment::
						
						if not can_meet then  -- Can't meet requirements yet, put this requirement at end of list
							--print("Can't meet requirements for " .. GetItemWithID(requirements_left[1]).location .. ", bumping to end of list. Available slots left: " .. #available_item_slots)
							
							local req = table.deepcopy(requirements_left[1])
							table.remove(requirements_left, 1)
							requirements_left[#requirements_left + 1] = req
						else
							local required_items = item_slot.item.req_items[math.ceil(math.random() * #item_slot.item.req_items)]
							
							if n_requirements < n_max_item_slots_needed then
								-- Find smallest item requirement combinations
								local item_requirement_combinations = item_slot.item.req_items
								shuffle(item_requirement_combinations)
								local required_items = {}
								for ii, item_reqs in pairs(item_requirement_combinations) do
									if #required_items <= 0 or #item_reqs < #required_items then
										required_items = item_reqs
									end
								end
							end
							
							if required_items ~= nil and #required_items > 0 then
								for ii, item in pairs(required_items) do
									-- Find out if the current item requirement is in the list of items we've already placed
									local has_item = false
									for l, available_item in ipairs(item_list) do
										if item.id == available_item then
											has_item = true
										end
									end
								  
									if not has_item then
										requirements_left[#requirements_left + 1] = item
									end
								end
							end
							
							if item_slot.item.ill_items ~= nil then
								filewrite('"' .. planets[item_slot.planet].host_item .. '" -> "' .. GetItemWithID(requirements_left[1]).host_item .. '\"[color="#ff0000",label="' .. item_slot.item.location .. '",fontsize=8]\n')
							else
								filewrite('"' .. planets[item_slot.planet].host_item .. '" -> "' .. GetItemWithID(requirements_left[1]).host_item .. '\"[color="#00ff00",label="' .. item_slot.item.location .. '",fontsize=8]\n')
							end
							
							--print(item_slot.item.host_item .. " -> " .. GetItemWithID(requirements_left[1]).host_item)
							item_list[item_slot.item.id] = requirements_left[1]
							
							RemoveItem(remaining_items, requirements_left[1])
							
							table.remove(available_item_slots, item_slot_id)
							table.remove(requirements_left, 1)
						end
						
						num_requirements_left = #requirements_left
						
						if (#requirements_left <= 0) then
							goto find_available_out
						end
					end
				end
			end
		end
		
		::found_available_out::
		
		-- Register new available item slots
		shuffle(found_planet.items)  -- Randomize items
		for i, item in pairs(found_planet.items) do
			available_item_slots[#available_item_slots + 1] = {planet=found_planet.id, item=GetItemWithID(item)}
		end
		
		-- Register new available outs
		shuffle(found_planet.infobots)  -- Randomize infobots
		for i, infobot in pairs(found_planet.infobots) do
			available_outs[#available_outs + 1] = {planet=found_planet.id, infobot=table.deepcopy(infobots[infobot])}
		end
		
		--print("out_index: " .. out_index)
		--for i, out in pairs(available_outs) do
		--	print(i .. ": " .. out.planet .. " : " .. out.infobot.id)
		--end
		
		--print(available_outs[out_index].infobot.id .. " -> " .. found_planet.id)
		
		if available_outs[out_index].planet == 0 then
			filewrite('"Veldin1" -> "' .. found_planet.host_item .. '"[label="Clank",fontsize=8]\n')
		else
			local orig_infobot_name = "Veldin2"
			
			if available_outs[out_index].infobot.id < 18 then
				orig_infobot_name = planets[available_outs[out_index].infobot.id].location  -- Fix special case for Veldin2
			end
		
			filewrite('"' .. planets[available_outs[out_index].planet].host_item .. '" -> "' .. found_planet.host_item .. '"[label="' .. orig_infobot_name .. '",fontsize=8]\n')
		end
		
		planet_list[available_outs[out_index].infobot.id] = found_planet.id  -- Replace infobot with next planet we found
		table.remove(available_outs, out_index)  -- We just used an available out, remove it
		table.remove(available_planets, planet_index)
		
		-- Add Veldin2 to list of available planets if we've placed all other planets.
		-- This doesn't necessarily make the longest path, but it's good enough for me. 
		if #available_planets <= 0 and #available_outs > 0 then
			available_planets[1] = {id=18,location="Battle through the ships",host_item="Veldin2",  infobots={}, items={}}
			planets[18] = {id=18,host_item="Veldin2",  infobots={}, items={}}
		end
		
		if #available_planets <= 0 then
			finished = true
		end
		
		--print("-")
		--print("")
	end
	
	-- Fill remaining items in remaining available item slots
	--print("**** Filling remaining " .. #available_item_slots .. " item slots!")
	shuffle(remaining_items)
	local passes3 = 0
	for i, item_slot in ipairs(available_item_slots) do
		::fuck::
	
		-- Deadlock prevention, idk if it's strictly necessary. Shit code is shit
		passes3 = passes3 + 1
		if passes3 > 200 then
			return -1
		end
	
		if item_slot.item.ill_items ~= nil then
			if InArray(item_slot.item.ill_items, remaining_items[1].id) then
				shuffle(remaining_items)
				goto fuck
			end
		end
	
		if item_slot.item.ill_items ~= nil then
			filewrite('"' .. planets[item_slot.planet].host_item .. '" -> "' .. remaining_items[1].host_item .. '\"[color="#ff00ff",label="' .. item_slot.item.location .. '",fontsize=8]\n')
		else
			filewrite('"' .. planets[item_slot.planet].host_item .. '" -> "' .. remaining_items[1].host_item .. '\"[color="#0000ff",label="' .. item_slot.item.location .. '",fontsize=8]\n')
		end
	
		--print(item_slot.item.host_item .. " -> " .. remaining_items[1].host_item)
		
		
		item_list[item_slot.item.id] = remaining_items[1].id
	
		table.remove(remaining_items, 1)
	end
	
	if #remaining_items > 0 then
		print("*************** Yo why are there " .. #remaining_items .. " items still not placed?")
	end
	
	filewrite("}\n")
	file:close()
	
	-- Apply planet and gadget/item replacements
	for i=1,18 do
		Ratchetron:WriteMemory(GAME_PID, 0xB00000 + i, 1, inttobytes(planet_list[i], 1))
		
		PlanetSpecificFix(i, planet_list[i])
	end
	
	for id, replacement in pairs(item_list) do
		ReplaceItem(id, replacement)
	end
	
	return 1
end

function trim1(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function OnLoad()
	-- Clear any previous randomizer data
	memset(0xb00000, 0, 0x300)
	
	local seed = os.time()
	
	local seed_file = io.open("seed.txt", "r")
	if seed_file ~= nil then
		local seed_text = seed_file:read("*a*")
		
		seed = LibDeflate:Crc32(trim1(seed_text), 0)
		
		if string.find(seed_text:gsub("%s+", ""), "#graph:false") then
			write_debug_graph = false
		end
	
		seed_file:close()
	end
	
	-- Repeatedly generate new path until it works. Bad code makes generation hard
	while Randomize(seed) <= 0 do
		--print("")
		--print("-----------------")
		--print("-----------------")  -- Just print a bunch of newlines so it's easy to distinguish attempts in the console
		--print("")
		seed = seed + 1
	end
	
	print("* Done!")
	
	if (game.planet == 0) then
		game:loadPlanet(0)
	end
end

function OnTick(ticks)
	
end

function OnUnload()

end