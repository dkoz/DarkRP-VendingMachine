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

-- Toggle the soda effect on and off.
vm.config.enableheal		= true
vm.config.enablearmor		= false
vm.config.enablespeed		= false
vm.config.enablehunger		= true
vm.config.enablethirst		= true

-- Sounds annoying you? Disable them.
vm.config.enablesounds		= true

-- Disable vending machine when there is a cook.
vm.config.disablewithcook	= true

-- Controls how much soda will cost from vending machine.
vm.config.sodaprice		= 20
-- Controls how much health the soda will give.
vm.config.sodaheal		= -5
-- Controls how much energy the soda will give. (HungerMod Only)
vm.config.sodaenergy		= 10
-- Controls how much thirst the soda will give.
vm.config.sodathirst		= 10
-- Control how much armor the soda will give.
vm.config.sodasuit		= 0
-- Control the amount of time the speed boost will last.
vm.config.speedtimer		= 30
-- Controls the speed multiplier.
vm.config.speedmult		= .5

-- Spawn locations of your vending machines.
vm.config.mapspawn = {} -- Do not edit this line

--[[
	vm.config.mapspawn["map_name"] = {		-- Specifies map that Vending Machine spawns on.
		pos = Vector( 0, 0, 0 ),	-- Specifies the vector of the Vending Machine.
		ang = Angle( 0, 0, 0 )		-- Specifies the angle of the Vending Machine.
	}
]]--

vm.config.mapspawn["rp_southside_day"] = {
	{
		pos = Vector( -6256.330566, 1120.998657, 82 ),
		ang = Angle( 0, -90, 0 )
	},

	{
		pos = Vector( 957.351563, 13800.475586, 212.031250 ),
		ang = Angle( 0, -90, 0 )
	},

	{
		pos = Vector( -1051.470703, 1988.245239, -9.968750 ),
		ang = Angle( 0, 180, 0 )
	},
}

vm.config.mapspawn["rp_downtown_evilmelon_v1"] = {
	{
		pos = Vector( 391, -1548, 49.031250 ),
		ang = Angle( 0, 90, 0 )
	},

	{
		pos = Vector( -2327, 163, 49.031250 ),
		ang = Angle( 0, -90, 0 )
	},

	{
		pos = Vector( -2327, 163, 49.031250 ),
		ang = Angle( 0, 0, 0 )
	},
}
