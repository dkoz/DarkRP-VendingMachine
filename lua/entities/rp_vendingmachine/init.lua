--[[
	Author: Koz
	Steam: http://steamcommunity.com/id/drunkenkoz
	Contact: mybbkoz@gmail.com

	License:
	You are free to use this software however you like; however,
	you cannot redistribute this code in any way without consent
	from the original author, Koz.
]]--

AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:Initialize()
	self:SetModel( "models/props_interiors/VendingMachineSoda01a.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
	
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion( false )
		phys:Wake()
	end
end

function ENT:CantAfford(activator)
   return vm.sodaprice
end

ENT.Once = false
function ENT:Use( ply, activator )
	if self.Once then return end

	if vm.disablewithcook == true then
		local cook = false
		for k, v in pairs( player.GetAll() ) do
			if v:Team() == TEAM_COOK then
				cook = true
				return ""
			end
			
		end
	end
	
	if not activator:canAfford( self:CantAfford( activator ) ) then
		DarkRP.notify( ply, 1, 4, "You can't afford a soda!" )
		return ""
	end
	
	self.Once = true
	
	local sodaprice = vm.sodaprice
	activator:addMoney( -sodaprice )
	DarkRP.notify( ply, 1, 4, "You've spent " .. GAMEMODE.Config.currency .. sodaprice .. " on a soda." )
	activator:EmitSound("oasisrp/vendingmachine/insertcoin.wav", 50, 100)
	timer.Create( self:EntIndex() .. "rp_soda", 1.5, 1, function()
		if not IsValid(self) then return end
		self:CreateSoda()
	end )
end

function ENT:CreateSoda()
	self.Once = false
	local fuck, you = LocalToWorld( Vector( 20, -5, -30 ), Angle( -90, -90, 0 ), self:GetPos(), self:GetAngles() )
	local soda = ents.Create( "rp_soda" )
	soda:SetPos( fuck )
	soda:SetAngles( you )
	soda:Spawn()
end

function ENT:OnRemove()
	if not IsValid(self) then return end
	timer.Destroy( self:EntIndex() .. "rp_soda" )
end