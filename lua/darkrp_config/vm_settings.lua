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
vm.config.enableHeal		= true
vm.config.enableArmor		= false
vm.config.enableSpeed		= false
vm.config.enableHunger		= false

-- Sounds annoying you? Disable them.
-- I think I never actually implemented this until now. lol
vm.config.enableSounds		= true

-- Disable vending machine when there is a cook.
vm.config.enableCook		= false

-- Controls how much soda will cost from vending machine.
vm.config.sodaPrice			= 25
-- Controls how much health the soda will give.
vm.config.sodaHeal			= 15
-- Controls how much energy the soda will give. (HungerMod Only)
vm.config.sodaEnergy		= 10
-- Control how much armor the soda will give.
vm.config.sodaArmor			= 10
-- Control the amount of time the speed boost will last.
vm.config.speedTimer		= 30
-- Controls the speed multiplier.
vm.config.speedMulti		= 1.5

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
		pos = Vector( 391, -1565, 49.031250 ),
		ang = Angle( 0, 90, 0 )
	},

	{
		pos = Vector( -2327, 170, 49.031250 ),
		ang = Angle( 0, -90, 0 )
	},

	{
		pos = Vector( -999, 3180, 49.031250 ),
		ang = Angle( 0, 0, 0 )
	},
}
