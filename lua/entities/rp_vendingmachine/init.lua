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

sodaprice = vm.config.sodaprice

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

ENT.Once = false
function ENT:Use( ply, activator )
	if self.Once then return end

	--[[ Disabled temporarily until optimized. 
	if vm.config.disablewithcook == true then
		local cook = false
		for k, v in pairs( player.GetAll() ) do
			if v:Team() == TEAM_COOK then
				cook = true
				return ""
			end
			
		end
	end]]--
	
	if not activator:canAfford( sodaprice ) then
		DarkRP.notify( ply, 1, 4, "You can't afford a ration!" )
		return ""
	end
	
	self.Once = true
	
	activator:addMoney( -sodaprice )
	DarkRP.notify( ply, 1, 4, "You purchased a ration for " .. GAMEMODE.Config.currency .. sodaprice .."." )
	activator:EmitSound("oasisrp/vendingmachine/insertcoin.wav", 50, 100)
	timer.Create( self:EntIndex() .. "rp_soda", 1.5, 1, function()
		if not IsValid(self) then return end
		self:CreateSoda()
	end )
end

function ENT:CreateSoda()
	self.Once = false
	local pos, ang = LocalToWorld( Vector( 15, 0, -22 ), Angle( 30, 0, 0 ), self:GetPos(), self:GetAngles() )
	local soda = ents.Create( "rp_soda" )
	soda:SetPos( pos )
	soda:SetAngles( ang )
	soda:Spawn()
end

function ENT:OnRemove()
	if not IsValid(self) then return end
	timer.Destroy( self:EntIndex() .. "rp_soda" )
end

function VendingMachineSpawn()
	local vmSpawn = vm.config.mapspawn[ game.GetMap() ]
	
	for k, v in pairs( vmSpawn ) do
		local vendingmachine = ents.Create( "rp_vendingmachine" )
		vendingmachine:SetPos( v.pos )
		vendingmachine:SetAngles( v.ang )
		vendingmachine:SetMoveType( MOVETYPE_NONE )
		vendingmachine:Spawn()
	end
end
hook.Add( "InitPostEntity", "SpawnVendingMachines", VendingMachineSpawn )
