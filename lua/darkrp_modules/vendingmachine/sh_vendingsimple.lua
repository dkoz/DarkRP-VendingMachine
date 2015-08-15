--[[
	Author: Koz
	Steam: http://steamcommunity.com/profiles/76561197989811664
	Contact: mybbkoz@gmail.com

	License:
	You are free to use this software however you like; however,
	you cannot redistribute this code in any way without consent
	from the original author, Koz.
]]--

AddCSLuaFile() -- Do not edit this line.
vm = vm or {} -- Do not edit this line.
vm.config = {} -- Do not edit this line.

-- Configuration - Edit below this line

-- Spawn locations of your vending machines.
vm.config.mapspawn = {} -- Do not edit this line

--[[
	vm.config.mapspawn["map_name"] = {		-- Specifies map that Vending Machine spawns on.
		pos = Vector( 0, 0, 0 ),	-- Specifies the vector of the Vending Machine.
		ang = Angle( 0, 0, 0 )		-- Specifies the angle of the Vending Machine.
	}
]]--

vm.config.mapspawn["rp_downtown_v4c_v2"] = {
	pos = Vector( -1780, -677, -148 ),
	ang = Angle( 0, -90, 0 )
}