--[[
	Author: Koz
	Steam: http://steamcommunity.com/id/drunkenkoz
	Contact: mybbkoz@gmail.com

	License:
	You are free to use this software however you like; however,
	you cannot redistribute this code in any way without consent
	from the original author, Koz.
]]--

vm = {} -- Do not edit this line.

-- Configuration

-- Toggle the soda effect on and off.
vm.enableheal		= true
vm.enablearmor		= false
vm.enablespeed		= false
vm.enablehunger		= false

-- Sounds annoying you? Disable them.
vm.enablesounds		= true

-- Disable vending machine when there is a cook.
vm.disablewithcook	= false

-- Controls how much soda will cost from vending machine.
vm.sodaprice		= 25
-- Controls how much health the soda will give.
vm.sodaheal			= 15
-- Controls how much energy the soda will give. (HungerMod Only)
vm.sodaenergy		= 5
-- Control how much armor the soda will give.
vm.sodasuit			= 10
-- Control the amount of time the speed boost will last.
vm.speedtimer		= 5
-- Controls the speed multiplier.
vm.speedmult		= 1.5

-- Spawn locations of your vending machines.
vm.mapspawn = {} -- Do not edit this line

--[[
	vm.mapspawn["map_name"] = {		-- Specifies map that Vending Machine spawns on.
		pos = Vector( 0, 0, 0 ),	-- Specifies the vector of the Vending Machine.
		ang = Angle( 0, 0, 0 )		-- Specifies the angle of the Vending Machine.
	}
]]--

vm.mapspawn["rp_downtown_v4c_v2"] = {
	pos = Vector( -1780, -677, -148 ),
	ang = Angle( 0, -90, 0 )
}

-- Do not edit below this point.
resource.AddFile( "sound/oasisrp/soda/slurp.wav" )
resource.AddFile( "sound/oasisrp/soda/burp.wav" )
resource.AddFile( "sound/oasisrp/vendingmachine/insertcoin.wav" )

-- Checks to see if Vending Machine is loading properly.
MsgC( Color( 0, 216, 255 ), "KoZ's Vending Machine has been loaded." )