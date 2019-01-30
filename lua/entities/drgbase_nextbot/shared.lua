ENT.Type = "nextbot"
ENT.Base = "base_nextbot"
ENT.IsDrGNextbot = true

function ENT:GetState()
  return self:GetDrGVar("DrGBaseState")
end

DrGBase.IncludeFile("ai.lua")
DrGBase.IncludeFile("animations.lua")
DrGBase.IncludeFile("behaviours.lua")
DrGBase.IncludeFile("detection.lua")
DrGBase.IncludeFile("hooks.lua")
DrGBase.IncludeFile("loco.lua")
DrGBase.IncludeFile("meta.lua")
DrGBase.IncludeFile("misc.lua")
DrGBase.IncludeFile("movement.lua")
DrGBase.IncludeFile("path.lua")
DrGBase.IncludeFile("possession.lua")
DrGBase.IncludeFile("relationships.lua")
DrGBase.IncludeFile("sounds.lua")
DrGBase.IncludeFile("weapons.lua")

-- Misc --
ENT.Models = {"models/player/kleiner.mdl"}
ENT.Skins = {0}
ENT.ModelScale = 1
ENT.RagdollOnDeath = true
ENT.AnimationType = DRGBASE_ANIMTYPE_SIMPLE
ENT.AmbientSounds = {}
ENT.HeadYaw = "head_yaw"
ENT.HeadPitch = "head_pitch"
ENT.AimYaw = "aim_yaw"
ENT.AimPitch = "aim_pitch"
ENT.Killicon = {
  icon = "HUD/killicons/default",
  color = Color(255, 80, 0, 255)
}

-- Stats --
ENT.MaxHealth = 100
ENT.HealthRegen = 0
ENT.Radius = 10000
ENT.Omniscient = false
ENT.ForgetTime = 10
ENT.FallDamage = false

-- Movements --
ENT.RunSpeed = 200
ENT.RunAnimation = ACT_HL2MP_RUN
ENT.RunAnimRate = 1
ENT.WalkSpeed = 100
ENT.WalkAnimation = ACT_HL2MP_WALK
ENT.WalkAnimRate = 1
ENT.IdleAnimation = ACT_HL2MP_IDLE
ENT.IdleAnimRate = 1
ENT.JumpAnimation = ACT_HL2MP_JUMP_KNIFE
ENT.JumpAnimRate = 1

-- Climbing --
ENT.ClimbLadders = false
ENT.ClimbWalls = false
ENT.ClimbSpeed = 100
ENT.ClimbAnimation = ACT_ZOMBIE_CLIMB_UP
ENT.ClimbAnimRate = 1
ENT.StopClimbing = 0
ENT.StartClimbAnimation = ""
ENT.StartClimbAnimRate = 1
ENT.StopClimbAnimation = ""
ENT.StopClimbAnimRate = 1

-- Relationships --
ENT.Factions = {}
ENT.AlliedWithSelfFactions = true
ENT.CommunicateWithAllies = false
ENT.Frightening = false
ENT.EnemyReach = 250
--ENT.EnemyStop = ENT.EnemyReach
ENT.EnemyAvoid = 0
ENT.AllyReach = 250
ENT.ScaredAvoid = 500
ENT.AttackScared = false

-- Weapons --
ENT.UseWeapons = false
ENT.Weapons = {}
ENT.WeaponAccuracy = 1
ENT.WeaponAttachmentLH = "Anim_Attachment_LH"
ENT.WeaponAttachmentRH = "Anim_Attachment_RH"
ENT.DropWeaponOnDeath = false

-- Detection --
ENT.SightFOV = 150
ENT.SightRange = 6000
ENT.EyeBone = ""
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.HearingRange = 250
ENT.HearingRangeBullets = 5000

-- Possession --
ENT.PossessionEnabled = false
ENT.PossessionRemote = true
ENT.PossessionViews = {}
ENT.PossessionBinds = {}

if SERVER then
  AddCSLuaFile("shared.lua")
  util.AddNetworkString("DrGBaseNextbotNoNavmesh")

  -- Init --

  function ENT:SpawnedBy() end
  hook.Add("PlayerSpawnedNPC", "DrGBaseNextbotPlayerSpawnedNPC", function(ply, ent)
    if not ent.IsDrGNextbot then return end
    ent:SetCreator(ply)
    if ent:SpawnedBy(ply) == false then ent:Remove() end
  end)

  function ENT:Initialize()
    self:SetModel(self.Models[math.random(#self.Models)])
    self:SetModelScale(self.ModelScale)
    self:SetSkin(self.Skins[math.random(#self.Skins)])
    self:SetCollisionGroup(COLLISION_GROUP_NPC)
    self:SetCollisionBounds(Vector(-10, -10, 0), Vector(10, 10, 70))
    self:SetMaxHealth(self.MaxHealth)
    self:SetHealth(self.MaxHealth)
    self:SetUseType(SIMPLE_USE)
    self.loco:SetDeathDropHeight(self.loco:GetStepHeight())
    self:SetPlaybackRate(1)
    self:AddFlags(FL_OBJECT + FL_CLIENT)
    self:CombineBall("dissolve")
    self.VJ_AddEntityToSNPCAttackList = true -- so vj snpcs can damage us
    self._DrGBaseCoroutineCallbacks = {} -- call functions inside coroutine
    self._DrGBaseSpotted = {} -- list of spotted entities
    self._DrGBaseHandleAnimDelay = 0 -- delay between animations handles
    self._DrGBaseSyncAnimations = false -- sync animations with speed
    self._DrGBaseCurrentAnimLastCycle = 0 -- current anim cycle
    self._DrGBaseCustomThinkDelay = 0 -- delay for custom think
    self._DrGBaseLOSCheckDelay = 0 -- los checks delay
    self._DrGBaseCustomBehaviour = false -- whether or not to use the custom behaviour
    self._DrGBaseCurrentGestures = {} -- table of current gestures
    self._DrGBaseOnFire = false -- save if the nextbot is on fire or not
    self._DrGBaseDownwardsVelocity = 0 -- used for fall damage
    self._DrGBaseHealth = self.MaxHealth -- log current health
    self._DrGBaseMaxHealth = self.MaxHealth -- log max health
    self._DrGBaseSequenceCallbacks = {} -- custom animation callbacks
    self._DrGBaseDefaultRelationship = D_NU -- default relationship
    self._DrGBaseEntityRelationships = {} -- relationships with entities
    self._DrGBaseClassRelationships = {} -- relationships with classes
    self._DrGBaseModelRelationships = {} -- model relationships
    self._DrGBaseFactionRelationships = {} -- relationships with factions
    self._DrGBaseCustomRelationships = {} -- custom relationship checks
    self._DrGBaseHandleEnemy = 0 -- search for enemy delay
    self._DrGBaseReady = false -- called after self:OnSpawn()
    self._DrGBaseFactions = {} -- list of factions that the nextbot is part of
    self._DrGBaseHealthRegenDelay = 0 -- health regen delay
    self._DrGBaseDefinedAttacks = {} -- attacks table
    self._DrGBaseSpeedFetch = true -- fetch speed ?
    self._DrGBaseLastAnimCycle = 0 -- for animation callbacks
    self._DrGBasePossessionThinkDelay = 0 -- possession think delay
    self._DrGBaseAttacking = false -- whether or not the nextbot is currently attacking
    self._DrGBaseHitGroups = {} -- list of hitgroups
    self._DrGBaseBlockRotation = false -- block rotation
    self._DrGBaseBlockInput = false -- block input
    self._DrGBaseLastSpeedCacheDelay = 0 -- speed cache delay
    self._DrGBaseOnContactDelay = 0 -- to avoid lag
    self._DrGBaseSlottedSounds = {} -- slotted sounds
    self:DefineHitGroup(HITGROUP_HEAD, {
      "ValveBiped.Bip01_Neck1",
      "ValveBiped.Bip01_Head1",
      "ValveBiped.forward"
    })
    self:DefineHitGroup(HITGROUP_CHEST, {
      "ValveBiped.Bip01_L_Clavicle",
      "ValveBiped.Bip01_R_Clavicle",
      "ValveBiped.Bip01_Spine2",
      "ValveBiped.Bip01_Spine4"
    })
    self:DefineHitGroup(HITGROUP_STOMACH, {
      "ValveBiped.Bip01_Spine",
      "ValveBiped.Bip01_Spine1",
      "ValveBiped.Bip01_Pelvis"
    })
    self:DefineHitGroup(HITGROUP_LEFTARM, {
      "ValveBiped.Bip01_L_UpperArm",
      "ValveBiped.Bip01_L_Forearm",
      "ValveBiped.Bip01_L_Hand",
      "ValveBiped.Anim_Attachment_LH",
      "ValveBiped.Bip01_L_Finger4",
      "ValveBiped.Bip01_L_Finger41",
      "ValveBiped.Bip01_L_Finger42",
      "ValveBiped.Bip01_L_Finger3",
      "ValveBiped.Bip01_L_Finger31",
      "ValveBiped.Bip01_L_Finger32",
      "ValveBiped.Bip01_L_Finger2",
      "ValveBiped.Bip01_L_Finger21",
      "ValveBiped.Bip01_L_Finger22",
      "ValveBiped.Bip01_L_Finger1",
      "ValveBiped.Bip01_L_Finger11",
      "ValveBiped.Bip01_L_Finger12",
      "ValveBiped.Bip01_L_Finger0",
      "ValveBiped.Bip01_L_Finger01",
      "ValveBiped.Bip01_L_Finger02"
    })
    self:DefineHitGroup(HITGROUP_RIGHTARM, {
      "ValveBiped.Bip01_R_UpperArm",
      "ValveBiped.Bip01_R_Forearm",
      "ValveBiped.Bip01_R_Hand",
      "ValveBiped.Anim_Attachment_RH",
      "ValveBiped.Bip01_R_Finger4",
      "ValveBiped.Bip01_R_Finger41",
      "ValveBiped.Bip01_R_Finger42",
      "ValveBiped.Bip01_R_Finger3",
      "ValveBiped.Bip01_R_Finger31",
      "ValveBiped.Bip01_R_Finger32",
      "ValveBiped.Bip01_R_Finger2",
      "ValveBiped.Bip01_R_Finger21",
      "ValveBiped.Bip01_R_Finger22",
      "ValveBiped.Bip01_R_Finger1",
      "ValveBiped.Bip01_R_Finger11",
      "ValveBiped.Bip01_R_Finger12",
      "ValveBiped.Bip01_R_Finger0",
      "ValveBiped.Bip01_R_Finger01",
      "ValveBiped.Bip01_R_Finger02"
    })
    self:DefineHitGroup(HITGROUP_LEFTLEG, {
      "ValveBiped.Bip01_L_Thigh",
      "ValveBiped.Bip01_L_Calf",
      "ValveBiped.Bip01_L_Foot",
      "ValveBiped.Bip01_L_Toe0"
    })
    self:DefineHitGroup(HITGROUP_RIGHTLEG, {
      "ValveBiped.Bip01_R_Thigh",
      "ValveBiped.Bip01_R_Calf",
      "ValveBiped.Bip01_R_Foot",
      "ValveBiped.Bip01_R_Toe0"
    })
    self:DefineHitGroup(HITGROUP_GEAR, {
      "ValveBiped.Bip01_Pelvis"
    })
    self:SetDrGVar("DrGBaseState", DRGBASE_STATE_NONE)
    self:SetDrGVar("DrGBaseSpeed", 0)
    self:SetDrGVar("DrGBaseDying", false)
    self:SetDrGVar("DrGBaseDead", false)
    self:SetDrGVar("DrGBaseEnemy", nil)
    self:SetDrGVar("DrGBaseDestination", nil)
    self:SetDrGVar("DrGBaseHealth", self.MaxHealth)
    self:SetDrGVar("DrGBaseMaxHealth", self.MaxHealth)
    self:SetDrGVar("DrGBaseScale", 1)
    self:SetDrGVar("DrGBasePossessionView", 1)
    self:SetDrGVar("DrGBaseAnimationSeed", math.random(0, 255))
    self:ResetRelationships()
    if self.UseWeapons and #self.Weapons > 0 then
      self:GiveWeapon(self.Weapons[math.random(#self.Weapons)])
    end
    self:_BaseInitialize()
    self:CustomInitialize()
    self:CallOnRemove("DrGBaseCallOnRemove", function()
      table.RemoveByValue(DrGBase.Nextbot._Spawned, self)
      if self:IsPossessed() then self:Dispossess() end
      if self._DrGBaseAmbientSound ~= nil then
        self:StopLoopingSound(self._DrGBaseAmbientSound)
        self._DrGBaseAmbientSound = nil
      end
      self:_Debug("remove.")
    end)
    table.insert(DrGBase.Nextbot._Spawned, self)
    self:_Debug("spawn.")
  end
  function ENT:_BaseInitialize() end
  function ENT:CustomInitialize() end

  -- Think --

  function ENT:Think()
    self:_HandleCustomHooks()
    self:_HandleLineOfSight()
    self:_HandleMovement()
    self:_HandleAnimations()
    self:_HandleEnemy()
    self:_HandlePossessionThink()
    self:_HandleAmbientSounds()
    self:_HandleHealthRegen()
    self:_BaseThink(self:GetState())
    if CurTime() > self._DrGBaseCustomThinkDelay then
      local nextThink = self:CustomThink(self:GetState()) or 0
      self._DrGBaseCustomThinkDelay = CurTime() + nextThink
    end
    if self:IsPossessed() and CurTime() > self._DrGBasePossessionThinkDelay then
      local nextThink = self:PossessionThink(self:GetPossessor(), self:PossessorTrace()) or 0
      self._DrGBasePossessionThinkDelay = CurTime() + nextThink
    end
  end
  function ENT:_BaseThink() end
  function ENT:CustomThink() end
  function ENT:PossessionThink() end

  -- RunBehaviour --

  function ENT:RunBehaviour()

    -- check for navmesh
    if not navmesh.IsLoaded() then
      self:_Debug("no navmesh.")
      self:NoNavmesh()
      net.Start("DrGBaseNextbotNoNavmesh")
      net.WriteEntity(self)
      net.Broadcast()
    end

    -- on spawn
    local spawned = self:OnSpawn()
    if spawned ~= nil and not spawned then self:Remove() end
    self:EnableSyncedAnimations(true)
    self._DrGBaseReady = true

    while true do

      -- coroutine callbacks
      while self:CoroutineCallbacks() do
        local cor = table.remove(self._DrGBaseCoroutineCallbacks, 1)
        cor.callback(CurTime() - cor.now)
      end

      if self:IsPossessed() then self:_HandlePossessionCoroutine() -- possession
      elseif navmesh.IsLoaded() and not GetConVar("ai_disabled"):GetBool() then -- ai behaviour

        if not self:EnableCustomBehaviour() then -- check if using custom behaviour
          self:_DefaultBehaviour()
        else
          self:_SetState(DRGBASE_STATE_CUSTOM)
          self:CustomBehaviour()
        end

      else self:_SetState(DRGBASE_STATE_NONE) end

      coroutine.yield()
    end

    self:Remove()
  end
  function ENT:OnSpawn() end
  function ENT:NoNavmesh() end
  function ENT:CustomBehaviour() end

  -- Setters --

  function ENT:_SetState(state)
    local oldstate = self:GetDrGVar("DrGBaseState")
    if oldstate ~= state then
      self:SetDrGVar("DrGBaseState", state)
      oldstate = oldstate or DRGBASE_NEXTBOT_STATE_NONE
      self:_Debug("state change ("..oldstate.." => "..state..")")
      self:OnStateChange(oldstate, state)
    end
  end
  function ENT:OnStateChange() end

  function ENT:EnableCustomBehaviour(bool)
    if bool == nil then return self._DrGBaseCustomBehaviour
    elseif bool then self._DrGBaseCustomBehaviour = true
    else self._DrGBaseCustomBehaviour = false end
  end

  -- Coroutine callbacks --

  function ENT:CallInCoroutine(callback)
    table.insert(self._DrGBaseCoroutineCallbacks, {
      callback = callback,
      now = CurTime()
    })
  end
  function ENT:CoroutineCallbacks()
    return #self._DrGBaseCoroutineCallbacks > 0
  end

  -- SLVBase --
  if file.Exists("autorun/slvbase", "LUA") then
    function ENT:PercentageFrozen() return 0 end
    function ENT:GetNoTarget() return false end
  end

  hook.Add("OnEntityCreated", "igugh", function(ent)
    if ent:GetClass() == "replicator_melon" then
      ent:AddFlags(FL_OBJECT)
      for i, ent2 in ipairs(ents.GetAll()) do
        if ent2:IsNPC() then
          ent2:AddEntityRelationship(ent, D_FR, 100)
        end
      end
    end
  end)

else

  local DebugInfo = CreateClientConVar("drgbase_debug_info", "0")
  local DebugLOS = CreateClientConVar("drgbase_debug_los", "0")
  local DebugRange = CreateClientConVar("drgbase_debug_range", "0")

  -- Client Init --

  function ENT:Initialize()
    if self._DrGBaseInitialized then return end
    self._DrGBaseInitialized = true
    self._DrGBaseCustomThinkDelay = 0
    self._DrGBasePossessionThinkDelay = 0
    self._DrGBaseLastState = DRGBASE_STATE_NONE
    self:_BaseInitialize()
    self:CustomInitialize()
  end
  function ENT:_BaseInitialize() end
  function ENT:CustomInitialize() end

  -- Client Think --

  function ENT:Think()
    if not self._DrGBaseInitialized then
      self:Initialize()
    end
    -- write here
    if self._DrGBaseLastState ~= self:GetState() then
      self:OnStateChange(self._DrGBaseLastState, self:GetState())
    end
    self._DrGBaseLastState = self:GetState()
    -- custom base think
    self:_BaseThink(self:GetState())
    -- custom
    if CurTime() > self._DrGBaseCustomThinkDelay then
      local nextThink = self:CustomThink(self:GetState()) or 0
      self._DrGBaseCustomThinkDelay = CurTime() + nextThink
    end
    if self:IsPossessedByLocalPlayer() and CurTime() > self._DrGBasePossessionThinkDelay then
      local nextThink = self:PossessionThink(self:GetPossessor(), self:PossessorTrace()) or 0
      self._DrGBasePossessionThinkDelay = CurTime() + nextThink
    end
  end
  function ENT:_BaseThink() end
  function ENT:OnStateChange() end
  function ENT:CustomThink() end
  function ENT:PossessionThink() end

  -- Draw --

  function ENT:Draw()
    self:DrawModel()
    if GetConVar("developer"):GetBool() then
      local bound1, bound2 = self:GetCollisionBounds()
      local center = self:GetPos() + (bound1 + bound2)/2
      local eyepos = self:EyePos()
      if DebugInfo:GetBool() then
        render.DrawWireframeBox(self:GetPos(), Angle(0, 0, 0), bound1, bound2, DrGBase.Colors.White, false)
        render.DrawLine(center, center + self:GetVelocity(), DrGBase.Colors.Orange, false)
        render.DrawWireframeSphere(center, 2*self:GetScale(), 4, 4, DrGBase.Colors.Orange, false)
        if self:HaveEnemy() then
          render.DrawLine(center, self:GetEnemy():WorldSpaceCenter(), DrGBase.Colors.Red, false)
        end
      end
      if DebugLOS:GetBool() then
        local los = DrGBase.Colors.Red
        if self:LineOfSight(LocalPlayer()) then los = DrGBase.Colors.Green end
        render.DrawWireframeSphere(eyepos, 2*self:GetScale(), 4, 4, los, false)
        render.DrawLine(eyepos, eyepos+self:EyeAngles():Forward()*30*self:GetScale(), los, false)
        if LocalPlayer():Alive() then
          render.DrawLine(eyepos, LocalPlayer():WorldSpaceCenter(), los, true)
        end
      end
      if DebugRange:GetBool() then
        render.DrawWireframeSphere(self:GetPos(), self.AllyReach*self:GetScale(), 25, 25, DrGBase.Colors.Green, true)
        render.DrawWireframeSphere(self:GetPos(), self.ScaredAvoid*self:GetScale(), 25, 25, DrGBase.Colors.Cyan, true)
        render.DrawWireframeSphere(self:GetPos(), self.EnemyReach*self:GetScale(), 25, 25, DrGBase.Colors.Red, true)
        render.DrawWireframeSphere(self:GetPos(), self.EnemyAvoid*self:GetScale(), 25, 25, DrGBase.Colors.Purple, true)
        if self.EnemyStop ~= nil then
          render.DrawWireframeSphere(self:GetPos(), self.EnemyStop*self:GetScale(), 25, 25, DrGBase.Colors.Orange, true)
        end

      end
    end
    return self:CustomDraw()
  end
  function ENT:CustomDraw() end

  -- Misc --

  function ENT:NoNavmesh() end
  net.Receive("DrGBaseNextbotNoNavmesh", function()
    local ent = net.ReadEntity()
    if IsValid(ent) and ent.NoNavmesh ~= nil then ent:NoNavmesh() end
  end)

end
