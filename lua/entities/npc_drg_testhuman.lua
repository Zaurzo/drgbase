if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot_human" -- DO NOT TOUCH (obviously)

-- Misc --
ENT.PrintName = "Test Human"
ENT.Category = "DrGBase"
ENT.Models = {
  "models/player/kleiner.mdl",
  "models/player/magnusson.mdl"
}

-- Movements --
ENT.UseWalkframes = true

-- Weapons --
ENT.Weapons = {
  "weapon_ar2",
  "weapon_smg1",
  "weapon_crossbow",
  "weapon_shotgun"
}
ENT.WeaponAccuracy = 0.75

if SERVER then

  -- Init/Think --

  function ENT:CustomInitialize()
    self:SetDefaultRelationship(D_HT)
    self:SetSelfModelRelationship(D_LI)
    self:SetFactionRelationship(FACTION_REBELS, D_LI)
  end

  -- AI --

  function ENT:OnIdle()
    self:AddPatrolPos(self:RandomPos(1500))
  end
  function ENT:OnReachedPatrol()
    self:Wait(math.random(3, 7))
  end

end

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)
