--[[
	Author: Koz
	Steam: http://steamcommunity.com/profiles/76561197989811664
	Contact: mybbkoz@gmail.com

	License:
	Attribution-NonCommercial-ShareAlike 2.0
]]--

AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

sodaprice = vm.config.sodaPrice

local cooksOnline = 0

for k, v in pairs( player.GetAll() ) do
	if v:Team() == TEAM_COOK then
		cooksOnline = cooksOnline + 1
	end
end

hook.Add( "DarkRPVarChanged", "DarkRPVendingMachineCookTracking", function( ply, varName, old, new )
	if varName ~= "job" then return end
	if new == "Cook" then
		cooksOnline = cooksOnline + 1
	end
	if old == "Cook" then
		cooksOnline = cooksOnline - 1
	end
end )

hook.Add( "PlayerDisconnected", "DarkRPVendingMachineCookTracking",function( ply )
	if ply:Team() == TEAM_COOK then
		cooksOnline = cooksOnline - 1
	end
end )

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
 
	if vm.config.enableCook == true then
		if cooksOnline > 0 then return end
	end
		
	if not activator:canAfford( sodaprice ) then
		DarkRP.notify( ply, 1, 4, "You can't afford a soda!" )
		return ""
	end
	
	self.Once = true
	
	activator:addMoney( -sodaprice )
	DarkRP.notify( ply, 1, 4, "You purchased a soda for " .. GAMEMODE.Config.currency .. sodaprice .."." )
	activator:EmitSound("oasisrp/vendingmachine/insertcoin.wav", 50, 100)
	timer.Create( self:EntIndex() .. "rp_soda", 1.5, 1, function()
		if not IsValid(self) then return end
		self:CreateSoda()
	end )
end

function ENT:CreateSoda()
	self.Once = false
	local fuck, you = LocalToWorld( Vector( 15, -2, -30 ), Angle( 0, 0, 90 ), self:GetPos(), self:GetAngles())
	local soda = ents.Create("rp_soda")
	soda:SetPos( fuck )
	soda:SetAngles( you )
	soda:Spawn()
	soda:PhysWake()
	soda:GetPhysicsObject():SetVelocity(Vector(you:Forward() * 15))
end

function ENT:OnRemove()
	if not IsValid(self) then return end
	timer.Destroy( self:EntIndex() .. "rp_soda" )
end


-- Credits to Code Blue for this.
-- Saves location of all Vending Machines in a JSON format.
local function SaveVendingMachine()
	local data = {}
	for k ,v in pairs(ents.FindByClass("rp_vendingmachine")) do
		table.insert(data, {pos = v:GetPos(), ang = v:GetAngles()})
	end
	if not file.Exists("rp_vendingmachine" , "DATA") then
		file.CreateDir("rp_vendingmachine")
	end

	file.Write("rp_vendingmachine/"..game.GetMap()..".txt", util.TableToJSON(data))
end

local function LoadVendingMachine()
	if file.Exists("rp_vendingmachine/"..game.GetMap()..".txt" , "DATA") then
		local data = file.Read("rp_vendingmachine/"..game.GetMap()..".txt", "DATA")
		data = util.JSONToTable(data)
		for k, v in pairs(data) do
			local slot = ents.Create("rp_vendingmachine")
			slot:SetPos(v.pos)
			slot:SetAngles(v.ang)
			slot:Spawn()
			slot:GetPhysicsObject():EnableMotion(false)
		end
		print("Oasis Vending Machine have loaded in.")
	else
		print("No map data found for Oasis Vending Machines. Use !szvend to save locations.")
	end
end

hook.Add("InitPostEntity", "SpawnVendingMachine", function()
	LoadVendingMachine()
end)

hook.Add("PlayerSay", "HandleSZVCommands" , function(ply, text)
	if string.sub(string.lower(text), 1, 10) == "!sz vend" then
		if table.HasValue(WOL_CONFIG.allowedRanks, ply:GetUserGroup()) then
			SaveVendingMachine()
			DarkRP.notify( ply, 0, 4, "Oasis Vending Machine have been save to map name "..game.GetMap().."!")
		else
			DarkRP.notify( ply, 0, 4, "You do not have permission to perform this action.")
		end
	end
end)