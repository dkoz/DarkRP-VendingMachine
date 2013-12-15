--[[
	Author: Koz
	Steam: http://steamcommunity.com/id/drunkenkoz
	Contact: mybbkoz@gmail.com

	License:
	You are free to use this software however you like; however,
	you cannot redistribute this code in any way without consent
	from the original author, Koz.
]]--

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:Initialize()
	self:SetModel("models/props_junk/PopCan01a.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	self.health = 10
	
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
end

function ENT:OnTakeDamage(dmg)
	self.health = self.health - dmg:GetDamage()
	if ( self.health <= 0 ) then
		self:Remove()
	end
end

function ENT:Use( activator )
	timer.Simple(0, function()
		activator:EmitSound( "oasisrp/soda/slurp.wav", 50, 100 )
	end)
	if vm.enablearmor == true then
		activator:SetArmor( math.Clamp( ( activator:Armor() or 100 ) + vm.sodasuit, 0, 100 ) )
	end
	if vm.enablespeed == true then
		local runspeed = GAMEMODE.Config.runspeed
		activator:SetRunSpeed( runspeed * vm.speedmult )
		timer.Simple( vm.speedtimer, function()
			activator:SetRunSpeed( runspeed )
		end )
	end
	if vm.enablehunger == true then
		activator:SetSelfDarkRPVar( "Energy", math.Clamp( ( activator:getDarkRPVar("Energy") or 100 ) + vm.sodaenergy, 0, 100 ) )
	end
	if vm.enableheal == true then
		activator:SetHealth( math.Clamp( ( activator:Health() or 100 ) + vm.sodaheal, 0, 100) )
	end
	self:Remove()
	timer.Simple(3, function()
		activator:EmitSound( "oasisrp/soda/burp.wav", 50, 100 )
	end)
end