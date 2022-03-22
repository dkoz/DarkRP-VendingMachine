ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Vending Machine"
ENT.Author = "KoZ"
ENT.Category = "ScrubZ Entities"

ENT.Spawnable			= true
ENT.AdminOnly			= true

function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0 , "price" )
	self:NetworkVar( "Entity", 1, "owning_ent" )
end