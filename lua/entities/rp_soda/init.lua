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
	self:SetModel( "models/props_junk/PopCan01a.mdl" )
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
	if vm.config.enableSound == true then
		timer.Simple( 0, function()
			activator:EmitSound( "oasisrp/soda/slurp.wav", 50, 100 )
		end )
		
		timer.Simple( 3, function()
			activator:EmitSound( "oasisrp/soda/burp.wav", 50, 100 )
		end )
	end

	if vm.config.enableArmor == true then
		activator:SetArmor( math.Clamp( ( activator:Armor() or 100 ) + vm.config.sodaArmor, 0, 100 ) )
	end
	
	if vm.config.enableSpeed == true then
		local runspeed = GAMEMODE.Config.runspeed
		activator:SetRunSpeed( runspeed * vm.config.speedMulti )
		timer.Simple( vm.config.speedTimer, function()
			activator:SetRunSpeed( runspeed )
		end )
	end
	
	if vm.config.enableHunger == true then
		activator:setSelfDarkRPVar( "Energy", math.Clamp( ( activator:getDarkRPVar("Energy") or 100 ) + vm.config.sodaEnergy, 0, 100 ) )
	end
	
	if vm.config.enableHeal == true then
		activator:SetHealth( math.Clamp( ( activator:Health() or 100 ) + vm.config.sodaHeal, 0, 100) )
	end

	if activator:Health() <= 0 then
		activator:Kill()
	end
	
	self:Remove()
end
