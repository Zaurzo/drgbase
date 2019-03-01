ENT.Type = "nextbot"
ENT.Base = "base_nextbot"
ENT.IsDrGNextbot = true

-- Misc --
ENT.Models = {"models/player/kleiner.mdl"}
ENT.Skins = {0}
ENT.ModelScale = 1
ENT.CollisionBounds = Vector(15, 15, 72)
ENT.RagdollOnDeath = true
ENT.RagdollCallback = function() end
ENT.AnimMatchSpeed = true
ENT.AnimMatchDirection = true
ENT.HeadYaw = "head_yaw"
ENT.HeadPitch = "head_pitch"
ENT.AimYaw = "aim_yaw"
ENT.AimPitch = "aim_pitch"
ENT.Killicon = {
  icon = "HUD/killicons/default",
  color = Color(255, 80, 0, 255)
}
ENT.AmbientSounds = {}
ENT.Footsteps = {
  [MAT_ANTLION] = {
    "physics/flesh/flesh_impact_hard1.wav",
    "physics/flesh/flesh_impact_hard2.wav",
    "physics/flesh/flesh_impact_hard3.wav",
    "physics/flesh/flesh_impact_hard4.wav",
    "physics/flesh/flesh_impact_hard5.wav",
    "physics/flesh/flesh_impact_hard6.wav"
  },
  [MAT_BLOODYFLESH] = {
    "physics/flesh/flesh_squishy_impact_hard1.wav",
    "physics/flesh/flesh_squishy_impact_hard2.wav",
    "physics/flesh/flesh_squishy_impact_hard3.wav",
    "physics/flesh/flesh_squishy_impact_hard4.wav"
  },
  [MAT_CONCRETE] = {
    "player/footsteps/concrete1.wav",
    "player/footsteps/concrete2.wav",
    "player/footsteps/concrete3.wav",
    "player/footsteps/concrete4.wav"
  },
  [MAT_DIRT] = {
    "player/footsteps/dirt1.wav",
    "player/footsteps/dirt2.wav",
    "player/footsteps/dirt3.wav",
    "player/footsteps/dirt4.wav"
  },
  [MAT_EGGSHELL] = {},
  [MAT_FLESH] = {
    "physics/flesh/flesh_impact_hard1.wav",
    "physics/flesh/flesh_impact_hard2.wav",
    "physics/flesh/flesh_impact_hard3.wav",
    "physics/flesh/flesh_impact_hard4.wav",
    "physics/flesh/flesh_impact_hard5.wav",
    "physics/flesh/flesh_impact_hard6.wav"
  },
  [MAT_GRATE] = {
    "player/footsteps/chainlink1.wav",
    "player/footsteps/chainlink2.wav",
    "player/footsteps/chainlink3.wav",
    "player/footsteps/chainlink4.wav"
  },
  [MAT_ALIENFLESH] = {
    "physics/flesh/flesh_impact_hard1.wav",
    "physics/flesh/flesh_impact_hard2.wav",
    "physics/flesh/flesh_impact_hard3.wav",
    "physics/flesh/flesh_impact_hard4.wav",
    "physics/flesh/flesh_impact_hard5.wav",
    "physics/flesh/flesh_impact_hard6.wav"
  },
  [MAT_CLIP] = {},
  [MAT_SNOW] = {
    "player/footsteps/grass1.wav",
    "player/footsteps/grass2.wav",
    "player/footsteps/grass3.wav",
    "player/footsteps/grass4.wav"
  },
  [MAT_PLASTIC] = {
    "physics/plastic/plastic_box_impact_soft1.wav",
    "physics/plastic/plastic_box_impact_soft2.wav",
    "physics/plastic/plastic_box_impact_soft3.wav",
    "physics/plastic/plastic_box_impact_soft4.wav"
  },
  [MAT_METAL] = {
    "player/footsteps/metal1.wav",
    "player/footsteps/metal2.wav",
    "player/footsteps/metal3.wav",
    "player/footsteps/metal4.wav"
  },
  [MAT_SAND] = {
    "player/footsteps/sand1.wav",
    "player/footsteps/sand2.wav",
    "player/footsteps/sand3.wav",
    "player/footsteps/sand4.wav"
  },
  [MAT_FOLIAGE] = {
    "player/footsteps/grass1.wav",
    "player/footsteps/grass2.wav",
    "player/footsteps/grass3.wav",
    "player/footsteps/grass4.wav"
  },
  [MAT_COMPUTER] = {
    "player/footsteps/metal1.wav",
    "player/footsteps/metal2.wav",
    "player/footsteps/metal3.wav",
    "player/footsteps/metal4.wav"
  },
  [MAT_SLOSH] = {
    "player/footsteps/slosh1.wav",
    "player/footsteps/slosh2.wav",
    "player/footsteps/slosh3.wav",
    "player/footsteps/slosh4.wav"
  },
  [MAT_TILE] = {
    "player/footsteps/tile1.wav",
    "player/footsteps/tile2.wav",
    "player/footsteps/tile3.wav",
    "player/footsteps/tile4.wav"
  },
  [MAT_GRASS] = {
    "player/footsteps/grass1.wav",
    "player/footsteps/grass2.wav",
    "player/footsteps/grass3.wav",
    "player/footsteps/grass4.wav"
  },
  [MAT_VENT] = {
    "player/footsteps/duct1.wav",
    "player/footsteps/duct2.wav",
    "player/footsteps/duct3.wav",
    "player/footsteps/duct4.wav"
  },
  [MAT_WOOD] = {
    "player/footsteps/wood1.wav",
    "player/footsteps/wood2.wav",
    "player/footsteps/wood3.wav",
    "player/footsteps/wood4.wav"
  },
  [MAT_DEFAULT] = {
    "player/footsteps/concrete1.wav",
    "player/footsteps/concrete2.wav",
    "player/footsteps/concrete3.wav",
    "player/footsteps/concrete4.wav"
  },
  [MAT_GLASS] = {
    "physics/glass/glass_sheet_step1.wav",
    "physics/glass/glass_sheet_step2.wav",
    "physics/glass/glass_sheet_step3.wav",
    "physics/glass/glass_sheet_step4.wav"
  },
  [MAT_WARPSHIELD] = {}
}

-- Stats --
ENT.MaxHealth = 100
ENT.HealthRegen = 0
ENT.FallDamage = false

-- AI --
ENT.PursueTime = 10
ENT.SearchTime = 50
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

-- Detection --
ENT.Omniscient = false
ENT.SightFOV = 150
ENT.SightRange = math.huge
ENT.EyeBone = ""
ENT.EyeOffset = Vector(0, 0, 0)
ENT.EyeAngle = Angle(0, 0, 0)
ENT.HearingRange = 250
ENT.HearingRangeBullets = 5000

-- Movements --
ENT.RunSpeed = 200
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1
ENT.WalkSpeed = 100
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 1
ENT.JumpAnimation = ACT_JUMP
ENT.JumpAnimRate = 1

-- Climbing --
ENT.ClimbLadders = false
ENT.ClimbWalls = false
ENT.ClimbWallsMaxHeight = math.huge
ENT.ClimbWallsMinHeight = 0
ENT.ClimbSpeed = 100
ENT.ClimbAnimation = ACT_CLIMB_UP
ENT.ClimbAnimRate = 1

-- Flight --
ENT.Flight = false
ENT.FlightSpeed = 300
ENT.FlightAnimation = ACT_JUMP
ENT.FlightAnimRate = 1
ENT.FlightUpAnimation = ""
ENT.FlightUpPitchThreshold = math.huge
ENT.FlightUpAnimRate = 1
ENT.FlightDownAnimation = ""
ENT.FlightDownPitchThreshold = -math.huge
ENT.FlightDownAnimRate = 1
ENT.FlightHoverAnimation = ""
ENT.FlightHoverAnimRate = 1
ENT.FlightMaxPitch = 45
ENT.FlightMinPitch = -45
ENT.FlightMatchPitch = false
ENT.FlightStrafe = false
ENT.FlightBackward = false
ENT.FlightUp = false
ENT.FlightDown = false

-- Weapons --
ENT.UseWeapons = false
ENT.Weapons = {}
ENT.WeaponAccuracy = 1
ENT.WeaponAttachmentLH = "Anim_Attachment_LH"
ENT.WeaponAttachmentRH = "Anim_Attachment_RH"
ENT.DropWeaponOnDeath = false
ENT.AcceptPlayerWeapons = false

-- Possession --
ENT.PossessionEnabled = false
ENT.PossessionPrompt = true
ENT.PossessionRemote = true
ENT.PossessionViews = {}
ENT.PossessionBinds = {}

local DebugAI = CreateConVar("drgbase_debug_ai", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
local DebugLOS = CreateConVar("drgbase_debug_los", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
local DebugMisc = CreateConVar("drgbase_debug_misc", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
local DebugHealth = CreateConVar("drgbase_debug_health", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
local DebugPath = CreateConVar("drgbase_debug_path", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})
local DebugMovement = CreateConVar("drgbase_debug_movement", "0", {FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED})

DrGBase.IncludeFile("ai.lua")
DrGBase.IncludeFile("animations.lua")
DrGBase.IncludeFile("behaviours.lua")
DrGBase.IncludeFile("detection.lua")
DrGBase.IncludeFile("flying.lua")
DrGBase.IncludeFile("hooks.lua")
DrGBase.IncludeFile("loco.lua")
DrGBase.IncludeFile("memory.lua")
DrGBase.IncludeFile("meta.lua")
DrGBase.IncludeFile("misc.lua")
DrGBase.IncludeFile("movement.lua")
DrGBase.IncludeFile("path.lua")
DrGBase.IncludeFile("possession.lua")
DrGBase.IncludeFile("projectiles.lua")
DrGBase.IncludeFile("relationships.lua")
DrGBase.IncludeFile("sounds.lua")
DrGBase.IncludeFile("weapons.lua")

function ENT:_Debug(text, convar)
  if not GetConVar("developer"):GetBool() then return end
  if isstring(convar) and not GetConVar(convar):GetBool() then return end
  DrGBase.Print("Nextbot '"..self:GetClass().."' ("..self:EntIndex().."): "..text)
end

function ENT:GetState()
  return self:GetDrGVar("DrGBaseState")
end

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
    self:_Debug("spawn.", "drgbase_debug_misc")
    self:SetModel(self.Models[math.random(#self.Models)])
    self:SetModelScale(self.ModelScale)
    self:SetSkin(self.Skins[math.random(#self.Skins)])
    self:SetCollisionGroup(COLLISION_GROUP_NPC)
    self:SetCollisionBounds(
      Vector(self.CollisionBounds.x, self.CollisionBounds.y, self.CollisionBounds.z),
      Vector(-self.CollisionBounds.x, -self.CollisionBounds.y, 0)
    )
    self:SetMaxHealth(self.MaxHealth)
    self:SetHealth(self.MaxHealth)
    self:SetUseType(SIMPLE_USE)
    self:SetPlaybackRate(1)
    self:AddFlags(FL_OBJECT + FL_CLIENT)
    self:CombineBall("dissolve")
    --self:SetSolidMask(MASK_NPCSOLID_BRUSHONLY)
    self.VJ_AddEntityToSNPCAttackList = true -- so vj snpcs can damage us
    self._DrGBaseCoroutineCallbacks = {} -- call functions inside coroutine
    self._DrGBaseMemory = {} -- list of spotted entities
    self._DrGBaseSyncAnimations = true -- sync animations with speed
    self._DrGBaseCustomThinkDelay = 0 -- delay for custom think
    self._DrGBaseLOSCheckDelay = 0 -- los checks delay
    self._DrGBaseCustomBehaviour = false -- whether or not to use the custom behaviour
    self._DrGBaseCurrentGestures = {} -- table of current gestures
    self._DrGBaseOnFire = false -- save if the nextbot is on fire or not
    self._DrGBaseDownwardsVelocity = 0 -- used for fall damage
    self._DrGBaseHealth = self.MaxHealth -- log current health
    self._DrGBaseSequenceCallbacks = {} -- custom animation callbacks
    self._DrGBaseDefaultRelationship = D_NU -- default relationship
    self._DrGBaseEntityRelationships = {} -- relationships with entities
    self._DrGBaseClassRelationships = {} -- relationships with classes
    self._DrGBaseModelRelationships = {} -- model relationships
    self._DrGBaseFactionRelationships = {} -- relationships with factions
    self._DrGBaseCustomRelationships = {} -- custom relationship checks
    self._DrGBaseHandleEnemy = 0 -- search for enemy delay
    self._DrGBaseFactions = {} -- list of factions that the nextbot is part of
    self._DrGBaseHealthRegenDelay = 0 -- health regen delay
    self._DrGBaseDefinedAttacks = {} -- attacks table
    self._DrGBaseSpeedFetch = true -- fetch speed ?
    self._DrGBaseLastAnimCycle = 0 -- for animation callbacks
    self._DrGBasePossessionThinkDelay = 0 -- possession think delay
    self._DrGBaseHitGroups = {} -- list of hitgroups
    self._DrGBaseBlockYaw = false -- block rotation
    self._DrGBaseBlockInput = false -- block input
    self._DrGBaseOnContactDelay = 0 -- to avoid lag
    self._DrGBaseSlottedSounds = {} -- slotted sounds
    self._DrGBaseTargets = {} -- targettable entities
    self._DrGBaseCustomTargetChecks = {} -- custom target checks
    self._DrGBaseTargetsList = {} -- to quickly check targets
    self._DrGBaseAnimationSeed = math.random(0, 255) -- to pick a random sequence
    self._DrGBasePitch = 0 -- flying pitch, 0 by default
    self._DrGBaseDynamicAvoidance = true -- dynamic avoidance
    self._DrGBaseHandleScaredOf = 0 -- delay between scared of checks
    self._DrGBaseNbHitGroups = 0 -- number of defined hitgroups
    self._DrGBaseDefinedProjectiles = {} -- defined projectiles
    self._DrGBaseThrownProjectiles = {} -- thrown projectiles
    self._DrGBaseHandleAnimationDelay = 0 -- animation think delay
    self._DrGBaseHandleMovementDelay = 0 -- movement think delay
    self._DrGBaseLineOfSight = {} -- register whether or not an entity is in sight
    self._DrGBaseEnableAmbientSounds = true -- toggle ambient sounds
    self:SetDrGVar("DrGBaseState", DRGBASE_STATE_NONE)
    self:SetDrGVar("DrGBaseSpeed", 0)
    self:SetDrGVar("DrGBaseDying", false)
    self:SetDrGVar("DrGBaseDead", false)
    self:SetDrGVar("DrGBaseEnemy", nil)
    self:SetDrGVar("DrGBaseDestination", nil)
    self:SetDrGVar("DrGBaseScale", 1)
    self:SetDrGVar("DrGBasePossessionView", 1)
    self:SetDrGVar("DrGBaseClimbing", false)
    self:SetDrGVar("DrGBaseFlying", false)
    self:SetDrGVar("DrGBaseWeaponReady", false)
    self:SetDrGVar("DrGBaseHostile", true)
    self:ResetRelationships() -- sets the factions
    if self.UseWeapons and #self.Weapons > 0 then
      self:GiveWeapon(self.Weapons[math.random(#self.Weapons)])
    end
    self:CallOnRemove("DrGBaseCallOnRemove", function()
      table.RemoveByValue(DrGBase.Nextbots._Spawned, self)
      if self:IsPossessed() then self:Dispossess() end
      if self._DrGBaseAmbientSound ~= nil then
        self:StopSound(self._DrGBaseAmbientSound)
        self._DrGBaseAmbientSound = nil
      end
      self:_Debug("remove.", "drgbase_debug_misc")
    end)
    self:_BaseInitialize()
    self:CustomInitialize()
    self:RefreshTargets()
    table.insert(DrGBase.Nextbots._Spawned, self)
  end
  function ENT:_BaseInitialize() end
  function ENT:CustomInitialize() end

  -- Think --

  function ENT:Think()
    self:_HandleCustomHooks()
    self:_HandleAnimations()
    self:_HandleMovement()
    self:_HandleFlight()
    self:_HandlePossessionThink()
    self:_HandleAmbientSounds()
    self:_HandleHealthRegen()
    if not GetConVar("ai_disabled"):GetBool() then
      self:_HandleEnemy()
      self:_HandleScaredOf()
      self:_HandleLineOfSight()
    end
    self:_BaseThink(self:GetState())
    if not self._DrGBaseMovingToPos and self:IsMoving() and
    not self:IsCharging() and self:IsOnGround() then
      self:_DynamicAvoidance(false)
    end
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
      self:NoNavmesh()
      net.Start("DrGBaseNextbotNoNavmesh")
      net.WriteEntity(self)
      net.Broadcast()
      self:EnableDynamicAvoidance(true)
    end

    -- on spawn
    self:OnSpawn()

    while true do

      -- coroutine callbacks
      while self:CoroutineCallbacks() do
        local cor = table.remove(self._DrGBaseCoroutineCallbacks, 1)
        cor.callback(CurTime() - cor.now)
      end

      if self:IsPossessed() then self:_HandlePossessionCoroutine() -- possession
      elseif not GetConVar("ai_disabled"):GetBool() then -- ai behaviour

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
      self:_Debug("state change: "..oldstate.." => "..state..".", "drgbase_debug_ai")
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

  local DebugRange = CreateClientConVar("drgbase_debug_range", "0")

  -- Client Init --

  function ENT:Initialize()
    if self._DrGBaseInitialized then return end
    self._DrGBaseInitialized = true
    self:SetIK(true)
    self._DrGBaseCustomThinkDelay = 0
    self._DrGBasePossessionThinkDelay = 0
    self._DrGBaseLastState = DRGBASE_STATE_NONE
    self._DrGBaseSequenceCallbacks = {}
    self._DrGBaseLastAnimCycle = 0
    self:_BaseInitialize()
    self:CustomInitialize()
  end
  function ENT:_BaseInitialize() end
  function ENT:CustomInitialize() end

  -- Client Think --

  function ENT:Think()
    self:Initialize()
    -- write here
    if self._DrGBaseLastState ~= self:GetState() then
      self:OnStateChange(self._DrGBaseLastState, self:GetState())
    end
    self._DrGBaseLastState = self:GetState()
    -- sequence callbacks
    local callbacks = self._DrGBaseSequenceCallbacks[self:GetSequence()]
    if callbacks ~= nil then
      for i, todo in ipairs(callbacks) do
        if self._DrGBaseLastAnimCycle < todo.cycle and self:GetCycle() >= todo.cycle then
          todo.callback(todo.cycle, self:GetCycle())
        end
      end
    end
    self._DrGBaseLastAnimCycle = self:GetCycle()
    -- line of sight debug
    if GetConVar("developer"):GetBool() and DebugLOS:GetBool() then
      self:CanSeeEntity(LocalPlayer(), function(los)
        self._DrGBaseCanSeeLocalPlayer = los
      end)
    end
    -- custom base think
    self:_BaseThink(self:GetState())
    -- custom
    if CurTime() > self._DrGBaseCustomThinkDelay then
      local nextThink = self:CustomThink(self:GetState()) or 0
      self._DrGBaseCustomThinkDelay = CurTime() + nextThink
    end
    if self:IsPossessedByLocalPlayer() then
      self:_HandlePossessionBinds()
      if CurTime() > self._DrGBasePossessionThinkDelay then
        local nextThink = self:PossessionThink(self:GetPossessor(), self:PossessorTrace()) or 0
        self._DrGBasePossessionThinkDelay = CurTime() + nextThink
      end
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
      if DebugMisc:GetBool() then
        render.DrawWireframeBox(self:GetPos(), Angle(0, 0, 0), bound1, bound2, DrGBase.Colors.White, false)
        render.DrawLine(center, center + self:GetVelocity(), DrGBase.Colors.Orange, false)
        render.DrawWireframeSphere(center, 2*self:GetScale(), 4, 4, DrGBase.Colors.Orange, false)
      end
      if DebugAI:GetBool() and self:HaveEnemy() then
        render.DrawLine(center, self:GetEnemy():WorldSpaceCenter(), DrGBase.Colors.Red, false)
      end
      if DebugLOS:GetBool() and self._DrGBaseCanSeeLocalPlayer ~= nil then
        local los = DrGBase.Colors.Red
        if self._DrGBaseCanSeeLocalPlayer then los = DrGBase.Colors.Green end
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
