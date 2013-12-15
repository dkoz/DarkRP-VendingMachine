--[[
	Author: Koz
	Steam: http://steamcommunity.com/id/drunkenkoz
	Contact: mybbkoz@gmail.com

	License:
	You are free to use this software however you like; however,
	you cannot redistribute this code in any way without consent
	from the original author, Koz.
]]--

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Vending Machine"
ENT.Author = "KoZ"
ENT.Category = "Koz's Vending Machine"

ENT.Spawnable			= true
ENT.AdminOnly			= true

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0 , "price" )
	self:NetworkVar( "Entity", 1, "owning_ent" )
end