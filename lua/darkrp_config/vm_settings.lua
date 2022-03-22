--[[
	Author: Koz
	Steam: http://steamcommunity.com/profiles/76561197989811664
	Contact: mybbkoz@gmail.com

	License:
	Attribution-NonCommercial-ShareAlike 2.0
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
vm.config.enableSound		= true

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

-- Table for soundLoop. Allows you to customize/remove sounds.
vm.config.soundLoop = {
	{
		Time = 0,
		Sound = "oasisrp/soda/opening.wav",
		Volume = 40
	},
	{
		Time = 1,
		Sound = "oasisrp/soda/slurp.wav",
		Volume = 40
	},
	{
		Time = 3.5,
		Sound = "oasisrp/soda/burp.wav",
		Volume = 40
	},
}

-- Vending machine spawns are now handled under JSON format
-- Use command "!sz vend" to save location of all vending machines on map.
