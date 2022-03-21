--[[
	Author: Koz
	Steam: http://steamcommunity.com/profiles/76561197989811664
	Contact: mybbkoz@gmail.com

	License:
	You are free to use this software however you like; however,
	you cannot redistribute this code in any way without consent
	from the original author, Koz.
]]--

AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:Initialize()
	self:SetModel("models/weapons/w_package.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	self.health = 100
	
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
--[[	timer.Simple( 0, function()
		activator:EmitSound( "oasisrp/soda/slurp.wav", 50, 100 )
	end )
	]]
	if vm.config.enablearmor == true then
		activator:SetArmor( math.Clamp( ( activator:Armor() or 100 ) + vm.config.sodasuit, 0, 100 ) )
	end
	
	if vm.config.enablespeed == true then
		local runspeed = GAMEMODE.Config.runspeed
		activator:SetRunSpeed( runspeed * vm.config.speedmult )
		timer.Simple( vm.config.speedtimer, function()
			activator:SetRunSpeed( runspeed )
		end )
	end
	
	if vm.config.enablehunger == true then
		activator:setSelfDarkRPVar( "Energy", math.Clamp( ( activator:getDarkRPVar("Energy") or 100 ) + vm.config.sodaenergy, 0, 100 ) )
	end
	
	if vm.config.enableheal == true then
		activator:SetHealth( math.Clamp( ( activator:Health() or 100 ) + vm.config.sodaheal, 0, 100) )
	end

	if activator:Health() <= 0 then
		activator:Kill()
	end
	if vm.config.enablethirst == true then
		activator:setSelfDarkRPVar( "Thirst", math.Clamp( ( activator:getDarkRPVar("Thirst") or 100 ) + vm.config.sodathirst, 0, 100) )
	end
	
	self:Remove()
	
	timer.Simple( 1, function()
		activator:EmitSound( "oasisrp/soda/burp.wav", 50, 100 )
	end )
end
